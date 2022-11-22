//
//  RiotSummonerMatchListAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import Foundation

struct RiotSummonerMatchListAPIRequest: RiotAPIRequest {
    
    typealias APIResponse = [String]

    var host: URLHost = .riotAsiaAPI
    var queryItems: [String : String]? {
        [
            "start": "0",
            "count": "10",
            "api_key": "RGAPI-e722b504-9a93-4a83-b664-37ea5f85ac71"
        ]
    }
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?

    init(puuid: String) {
        path = .matchList(puuid: puuid)
    }
}
