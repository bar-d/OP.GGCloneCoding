//
//  DefaultSummonerMatchRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/15.
//

import CoreData

struct DefaultSummonerMatchRepository: SummonerMatchRepository {
    
    // MARK: Properties

    private let riotAPIService: RiotAPIService
    private let cache: CoreDataSummonerMatchEntityStorage

    // MARK: - Initializers

    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: CoreDataSummonerMatchEntityStorage = CoreDataSummonerMatchEntityStorage.shared
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerMatchAPIRequest

extension DefaultSummonerMatchRepository {
    func fetchSummonerInformation(
        matchIDList: [String],
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    ) {
        var array: [SummonerMatch] = []
        var shouldConnectToNetwork = false
        var hasErrorOccured = false

        matchIDList.forEach { matchID in
            guard let request: NSFetchRequest<SummonerMatchEntity> = cache.fetchRequest(matchID: matchID),
                  let cachedData = cache.read(by: request)?.toDTO() else {
                shouldConnectToNetwork = true
                print("네트워크 필요 💙💙")

                return
            }

            guard let summonerMatch = cachedData.toDomain() else {
                hasErrorOccured = true
                print("에러발생 💔💔")

                return
            }

            array.append(summonerMatch)
        }

        if hasErrorOccured {
            completion(.failure(DTOError.invalidTransformation))
            print("에러발생 💔")
        } else if shouldConnectToNetwork {
            connectToNetwork(by: matchIDList, with: completion)
            print("네트워크 필요 💙")
        } else {
            completion(.success(array))
            print("캐시 존재 ❤️")
        }
    }

    private func connectToNetwork(by matchIDList: [String], with completion: @escaping (Result<[SummonerMatch], Error>) -> Void) {

        var array: [SummonerMatch] = []

        matchIDList.forEach { matchID in
            let summonerMatchRequest = Request(matchID: matchID)

            riotAPIService.execute(summonerMatchRequest) { result in
                switch result {
                case .success(let response):
                    cache.createUsing(matchID: matchID, data: response)

                    guard let summonerMatchInformation = response.toDomain() else {
                        completion(.failure(DTOError.invalidTransformation))

                        return
                    }

                    print("😍")
                    array.append(summonerMatchInformation)

                    if array.count == 10 {
                        completion(.success(array))
                    }
                case .failure(let error):
                    print("🥵🥵🥵🥵")
                    completion(.failure(error))
                }
            }
        }
    }
}
