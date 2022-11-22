//
//  SummonerMatch.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerMatch: Codable {
    let participants: [Participant]

    private enum CodingKeys: String, CodingKey {
        case participants
    }
}

extension SummonerMatch {
    struct Participant: Codable {
        let summonerName: String
        let assists: Int
        let deaths: Int
        let kills: Int
        let win: Bool
        let kda: Double

        enum CodingKeys: String, CodingKey {
            case summonerName, assists, deaths, kills, win, kda
        }
    }
}
