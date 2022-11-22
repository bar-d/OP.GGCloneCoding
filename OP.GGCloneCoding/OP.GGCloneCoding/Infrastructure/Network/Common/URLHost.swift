//
//  URLHost.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

enum URLHost {
    case riotAPI
    case riotAsiaAPI
    case dataDragon

    var url: String {
        switch self {
        case .riotAPI:
            return "https://kr.api.riotgames.com"
        case .riotAsiaAPI:
            return "https://asia.api.riotgames.com"
        case .dataDragon:
            return "https://ddragon.leagueoflegends.com"
        }
    }
}
