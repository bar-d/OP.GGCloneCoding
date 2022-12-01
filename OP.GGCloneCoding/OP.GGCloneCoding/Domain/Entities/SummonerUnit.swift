//
//  SummonerUnit.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

struct SummonerUnit: Codable {
    let id: String
    let puuid: String
    let name: String
    let profileIconID: Int
    let summonerLevel: Int

    private enum CodingKeys: String, CodingKey  {
        case id
        case puuid
        case name
        case profileIconID = "profileIconId"
        case summonerLevel
    }
}
