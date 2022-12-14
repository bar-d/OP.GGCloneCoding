//
//  DefaultSummonerMatchRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/15.
//

import Foundation

struct DefaultSummonerMatchRepository: SummonerMatchRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    
    // MARK: - Initializers
    
    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
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
        
        matchIDList.forEach { matchID in
            let summonerMatchRequest = Request(matchID: matchID)
            
            riotAPIService.execute(summonerMatchRequest) { result in
                switch result {
                case .success(let response):
                    guard let summonerMatchInformation = response.toDomain() else {
                        completion(.failure(DTOError.invalidTransformation))
                        
                        return
                    }

                    print("π")
                    /// λ€νΈμν¬ λλ μ΄ μΆν ν΄κ²° νμ
                    array.append(summonerMatchInformation)
                    if array.count == 10 {
                        completion(.success(array))
                    }
                    
                case .failure(let error):
                    print("π₯΅π₯΅π₯΅π₯΅")
                    UserDefaults.standard.set(
                        false,
                        forKey: "didSummonerSelected"
                    )
                    completion(.failure(error))
                }
            }
        }
    }
}
