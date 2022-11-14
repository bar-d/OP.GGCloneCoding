//
//  RiotSummonerMatchAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/10.
//

import Foundation

struct RiotSummonerMatchAPIRequest: RiotAPIRequest {
    typealias APIResponse = [String]

    var host: URLHost = .riotAsiaAPI
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?

    init(matchID: String) {
        path = .match(matchID: matchID)
    }
}
