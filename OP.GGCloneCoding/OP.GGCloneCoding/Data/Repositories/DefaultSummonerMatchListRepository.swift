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
                if response.isEmpty {
                    UserDefaults.standard.removeObject(forKey: "MySummonerInformation")
                    completion(.success(response))
                }
                
                UserDefaults.standard.set(response, forKey: "MatchList")
                guard let unarchivedSummonerData = UserDefaults.standard.object(forKey: "MatchList") as? [String] else { return }
                
                if unarchivedSummonerData == response {
                    UserDefaults.standard.set(true, forKey: "DidMatchListChanged")
                } else {
                    UserDefaults.standard.set(false, forKey: "DidMatchListChanged")
                }
                
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
