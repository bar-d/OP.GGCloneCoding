//
//  RiotSummonerRankAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/10.
//

import Foundation

struct RiotSummonerRankAPIRequest: RiotAPIRequest {
    
    typealias APIResponse = [RiotAPIResponseDTO.LeagueEntryDTO]

    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?

    init(encryptedSummonerID: String) {
        path = .league(encryptedSummonerID: encryptedSummonerID)
    }
}
