//
//  RiotSummonerAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
//

import Foundation

struct RiotSummonerAPIRequest: RiotAPIRequest {
    
    typealias APIResponse = RiotAPIResponseDTO.SummonerDTO

    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?

    init(summonerID: String) {
        guard let summonerID = summonerID.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) else {
            return
        }

        path = .summoner(summonerID: summonerID)
    }
}
