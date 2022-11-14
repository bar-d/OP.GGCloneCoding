//
//  DefaultSummonerRankRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct DefaultSummonerRankRepository: SummonerRankRepository {
    private let riotAPIService: RiotAPIService

    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

extension DefaultSummonerRankRepository {
    func fetchSummonerInformation(
        encryptedSummonerID: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        let summonerRankRequest = RiotSummonerRankAPIRequest(encryptedSummonerID: encryptedSummonerID)

        riotAPIService.execute(summonerRankRequest) { result in
            switch result {
            case .success(let response):
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
