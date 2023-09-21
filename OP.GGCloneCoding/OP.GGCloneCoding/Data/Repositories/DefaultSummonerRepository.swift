//
//  DefaultSummonerRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

struct DefaultSummonerRepository: SummonerRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    private let cache: SummonerStorage

    // MARK: - Initializers
    
    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: SummonerStorage = UserDefaultsSummonerStorage()
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerAPIRequest

extension DefaultSummonerRepository {
    func fetchSummonerInformation(
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        let summonerRequest = Request(summonerID: id)

        riotAPIService.execute(summonerRequest) { result in
            switch result {
            case .success(let response):
                guard let summonerInformation = response.toDomain() else {
                    completion(.failure(DTOError.invalidTransformation))

                    return
                }

                cache.save(summonerInformation)
                completion(.success(summonerInformation))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSummoner() -> Summoner? {
        cache.getSummoner()
    }
}
