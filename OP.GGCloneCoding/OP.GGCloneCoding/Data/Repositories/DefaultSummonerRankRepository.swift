//
//  DefaultSummonerRankRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import CoreData

struct DefaultSummonerRankRepository: SummonerRankRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    private let cache: CoreDataSummonerRankTierStorage

    // MARK: - Initializers

    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: CoreDataSummonerRankTierStorage = CoreDataSummonerRankTierStorage.shared
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerRankAPIRequest

extension DefaultSummonerRankRepository {
    func fetchSummonerInformation(
        encryptedSummonerID: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        guard let request: NSFetchRequest<SummonerRankTier> = cache.fetchRequest(id: encryptedSummonerID),
              let cachedData = cache.readAll(by: request),
              !cachedData.isEmpty else {
            connectToNetwork(
                by: encryptedSummonerID,
                with: completion
            )

            return
        }

        var array: [SummonerRank] = []

        cachedData.forEach { data in
            let leagueEntryDTO = data.toDTO()

            guard let summonerRankInformation = leagueEntryDTO.toDomain() else {
                completion(.failure(DTOError.invalidTransformation))

                return
            }
            array.append(summonerRankInformation)
        }

        completion(.success(array))
    }

    private func connectToNetwork(by encryptedSummonerID: String, with completion: @escaping (Result<[SummonerRank], Error>) -> Void) {
        let summonerRankRequest = Request(encryptedSummonerID: encryptedSummonerID)

        riotAPIService.execute(summonerRankRequest) { result in
            switch result {
            case .success(let response):
                response.forEach { dto in
                    cache.create(data: dto)
                }

                var array: [SummonerRank] = []

                response.forEach { leagueEntryDTO in
                    guard let summonerRankInformation = leagueEntryDTO.toDomain() else {
                        completion(.failure(DTOError.invalidTransformation))

                        return
                    }
                    array.append(summonerRankInformation)
                }

                completion(.success(array))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
