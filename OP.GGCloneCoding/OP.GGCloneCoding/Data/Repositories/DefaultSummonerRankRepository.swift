//
//  DefaultSummonerRankRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct DefaultSummonerRankRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    private let cache: SummonerRankListStorage
    
    // MARK: - Initializers
    
    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: SummonerRankListStorage = UserDefaultsSummonerRankListStorage()
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerRankAPIRequest

extension DefaultSummonerRankRepository: SummonerRankRepository {
    func fetchSummonerInformation(
        encryptedSummonerID: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        let summonerRankRequest = Request(encryptedSummonerID: encryptedSummonerID)

        riotAPIService.execute(summonerRankRequest) { result in
            switch result {
            case .success(let response):
                var summonerRankList: [SummonerRank] = []

                response.forEach { leagueEntryDTO in
                    guard let summonerRankInformation = leagueEntryDTO.toDomain() else {
                        completion(.failure(DTOError.invalidTransformation))

                        return
                    }
                    summonerRankList.append(summonerRankInformation)
                }
                
                cache.save(summonerRankList)
                completion(.success(summonerRankList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSummonerRankList() -> [SummonerRank] {
        return cache.getSummonerRankList()
    }
}
