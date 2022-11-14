//
//  DefaultSummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/10.
//

import Foundation

struct DefaultSummonerMatchListRepository: SummonerMatchListRepository {
    private let riotAPIService: RiotAPIService

    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

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
