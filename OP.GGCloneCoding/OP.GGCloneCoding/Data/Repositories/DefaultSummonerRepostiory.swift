//
//  DefaultSummonerRepostiory.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

struct DefaultSummonerRepostiory: SummonerRepository {
    private let riotAPIService: RiotAPIService

    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

extension DefaultSummonerRepostiory {
    func fetchSummonerInformation(
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        let summonerRequest = RiotSummonerAPIRequest(summonerID: id)

        riotAPIService.execute(summonerRequest) { result in
            switch result {
            case .success(let response):
                guard let summonerInformation = response.toDomain() else {
                    completion(.failure(DTOError.invalidTransformation))

                    return
                }

                completion(.success(summonerInformation))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
