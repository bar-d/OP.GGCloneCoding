//
//  SummonerRank.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerRank: Codable {
    let queueType: String
    let tier: String
    let rank: String
    let leaguePoints: Int
    let wins: Int
    let losses: Int

    private enum CodingKeys: String, CodingKey {
        case queueType
        case tier
        case rank
        case leaguePoints
        case wins
        case losses
    }
}
