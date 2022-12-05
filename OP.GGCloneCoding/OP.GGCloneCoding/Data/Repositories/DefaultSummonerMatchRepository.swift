//
//  DefaultSummonerMatchRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/15.
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

                    print("😍")
                    /// 네트워크 딜레이 추후 해결 필요
                    array.append(summonerMatchInformation)
                    if array.count == 10 {
                        completion(.success(array))
                    }
                    
                case .failure(let error):
                    print("🥵🥵🥵🥵")
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
