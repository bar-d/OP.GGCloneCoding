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
        let id, accountID, puuid, name: String
        let profileIconID, revisionDate, summonerLevel: Int

        private enum CodingKeys: String, CodingKey {
            case id
            case accountID = "accountId"
            case puuid, name
            case profileIconID = "profileIconId"
            case revisionDate, summonerLevel
        }
    }

    struct LeagueEntryDTO: Decodable {
        let leagueID, summonerID, summonerName, queueType, tier, rank: String
        let leaguePoints, wins, losses: Int
        let hotStreak, veteran, freshBlood, inactive: Bool

        private enum CodingKeys: String, CodingKey {
            case leagueID = "leagueId"
            case summonerID = "summonerId"
            case summonerName, queueType, tier, rank, leaguePoints, wins, losses, hotStreak, veteran, freshBlood, inactive
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
