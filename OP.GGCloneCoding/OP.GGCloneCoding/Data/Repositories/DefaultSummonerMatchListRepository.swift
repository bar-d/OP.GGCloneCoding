//
//  DefaultSummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct DefaultSummonerMatchListRepository: SummonerMatchListRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService

    // MARK: - Initializers
    
    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

// MARK: - Extension

extension DefaultSummonerMatchListRepository {
    func fetchSummonerInformation(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        let summonerMatchListRequest = RiotSummonerMatchListAPIRequest(puuid: puuid)

        riotAPIService.execute(summonerMatchListRequest) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
