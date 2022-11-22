//
//  RiotSummonerMatchAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct RiotSummonerMatchAPIRequest: RiotAPIRequest {
    
    typealias APIResponse = RiotAPIResponseDTO.MatchDTO

    // MARK: Properties
    
    var host: URLHost = .riotAsiaAPI
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?
    
    // MARK: - Initializers

    init(matchID: String) {
        path = .match(matchID: matchID)
    }
}
