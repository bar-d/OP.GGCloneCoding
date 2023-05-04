//
//  DefaultSummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct DefaultSummonerMatchListRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    private let cache: MatchListStorage

    // MARK: - Initializers
    
    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: MatchListStorage = UserDefaultsMatchListStorage()
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerMatchListAPIRequest

extension DefaultSummonerMatchListRepository: SummonerMatchListRepository {
    func fetchSummonerInformation(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        let summonerMatchListRequest = Request(puuid: puuid)

        riotAPIService.execute(summonerMatchListRequest) { result in
            switch result {
            case .success(let response):
                let unarchivedMatchListData = response as [String]
                
                cache.save(unarchivedMatchListData)
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSummonerMatchIDList() -> [String] {
        cache.getSummonerMatchIDList()
    }
}
