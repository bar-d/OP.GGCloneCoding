//
//  DefaultSummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import CoreData

struct DefaultSummonerMatchListRepository: SummonerMatchListRepository {
    
    // MARK: Properties

    private let riotAPIService: RiotAPIService
    private let cache: CoreDataSummonerMatchListEntityStorage

    // MARK: - Initializers

    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: CoreDataSummonerMatchListEntityStorage = CoreDataSummonerMatchListEntityStorage.shared
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerMatchListAPIRequest

extension DefaultSummonerMatchListRepository {
    func fetchSummonerInformation(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        let summonerMatchListRequest = Request(puuid: puuid)

        riotAPIService.execute(summonerMatchListRequest) { result in
            switch result {
            case .success(let response):

                // switch 로도 할 수 있을것 같은데?? nil / equal / different
                guard let fetchRequest: NSFetchRequest<SummonerMatchListEntity> = cache.fetchRequest(puuid: puuid),
                      let cachedData = cache.read(by: fetchRequest) else {
                    cache.create(data: response)

                    completion(.success(response))

                    return
                }

                if cachedData.matchList == response {
                    UserDefaults.standard.set(false, forKey: "DidMatchListChanged")
                } else {
                    UserDefaults.standard.set(true, forKey: "DidMatchListChanged")
                    cache.create(data: response)
                }

                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
