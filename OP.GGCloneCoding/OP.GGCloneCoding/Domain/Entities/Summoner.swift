//
//  Summoner.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

struct Summoner: Decodable {
    let id: String
    let accountID: String
    let puuid: String
    let name: String
    let profileIconID: Int
    let revisionDate: Int
    let summonerLevel: Int

    private enum CodingKeys: String, CodingKey  {
        case id
        case accountID = "accountId"
        case puuid
        case name
        case profileIconID = "profileIconId"
        case revisionDate
        case summonerLevel
    }
}
