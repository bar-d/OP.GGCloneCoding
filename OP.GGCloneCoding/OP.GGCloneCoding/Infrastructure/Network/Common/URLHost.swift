//
//  URLHost.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

enum URLHost {
    case riotAPI

    var url: String {
        switch self {
        case .riotAPI:
            return "https://kr.api.riotgames.com"
        }
    }
}
