//
//  RiotAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
//

protocol RiotAPIRequest: APIRequest { }

extension RiotAPIRequest {
    var host: URLHost {
        .riotAPI
    }

    var queryItems: [String : String]? {
        ["api_key": "RGAPI-e722b504-9a93-4a83-b664-37ea5f85ac71"]
    }
}
