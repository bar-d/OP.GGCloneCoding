//
//  RiotAPIResponseDTO.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

struct RiotAPIResponseDTO: Decodable { }

extension RiotAPIResponseDTO {
    struct SummonerDTO: Decodable {
        let id: String
        let accountID: String
        let puuid: String
        let name: String
        let profileIconID: Int
        let revisionDate: Int
        let summonerLevel: Int

        private enum CodingKeys: String, CodingKey {
            case id
            case accountID = "accountId"
            case puuid
            case name
            case profileIconID = "profileIconId"
            case revisionDate
            case summonerLevel
        }
    }

    struct LeagueEntryDTO: Decodable {
        let leagueID: String
        let summonerID: String
        let summonerName: String
        let queueType: String
        let tier: String
        let rank: String
        let leaguePoints: Int
        let wins: Int
        let losses: Int
        let hotStreak: Bool
        let veteran: Bool
        let freshBlood: Bool
        let inactive: Bool

        private enum CodingKeys: String, CodingKey {
            case leagueID = "leagueId"
            case summonerID = "summonerId"
            case summonerName
            case queueType
            case tier
            case rank
            case leaguePoints
            case wins
            case losses
            case hotStreak
            case veteran
            case freshBlood
            case inactive
        }
    }
}

extension RiotAPIResponseDTO.SummonerDTO {
    func toDomain() -> Summoner? {
        return .init(
            id: id,
            accountID: accountID,
            puuid: puuid,
            name: name,
            profileIconID: profileIconID,
            revisionDate: revisionDate,
            summonerLevel: summonerLevel
        )
    }
}

extension RiotAPIResponseDTO.LeagueEntryDTO {
    func toDomain() -> SummonerRank? {
        return .init(
            queueType: queueType,
            tier: tier,
            rank: rank,
            leaguePoints: leaguePoints,
            wins: wins,
            losses: losses
        )
    }
}
