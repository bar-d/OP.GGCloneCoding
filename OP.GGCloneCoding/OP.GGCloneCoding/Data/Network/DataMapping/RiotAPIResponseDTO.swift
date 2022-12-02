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
        let id, puuid, name: String
        let profileIconID, summonerLevel: Int

        private enum CodingKeys: String, CodingKey {
            case id
            case puuid, name
            case profileIconID = "profileIconId"
            case summonerLevel
        }
    }

    struct LeagueEntryDTO: Decodable {
        let summonerID, queueType, tier, rank: String
        let leaguePoints, wins, losses: Int

        private enum CodingKeys: String, CodingKey {
            case summonerID = "summonerId"
            case queueType, tier, rank, leaguePoints, wins, losses
        }
    }

    struct MatchDTO: Decodable {
        let info: InfoDTO
    }
}

extension RiotAPIResponseDTO.SummonerDTO {
    func toDomain() -> SummonerUnit? {
        return .init(
            id: id,
            puuid: puuid,
            name: name,
            profileIconID: profileIconID,
            summonerLevel: summonerLevel
        )
    }
}

extension RiotAPIResponseDTO.LeagueEntryDTO {
    func toDomain() -> SummonerRank? {
        return .init(
            queueType: queueType,
            tier: tier,
            rank: rank.convertRomanToNumeric(),
            leaguePoints: leaguePoints,
            wins: wins,
            losses: losses
        )
    }
}

extension RiotAPIResponseDTO.MatchDTO {
    struct InfoDTO: Decodable {
        let gameCreation, gameDuration, gameEndTimestamp: Int
        let gameMode: String
        let gameStartTimestamp: Int
        let participants: [ParticipantDTO]
        let queueID: Int
        let teams: [TeamDTO]

        enum CodingKeys: String, CodingKey {
            case gameCreation, gameDuration, gameEndTimestamp, gameMode,
                 gameStartTimestamp, participants
            case queueID = "queueId"
            case teams
        }
    }

    func toDomain() -> SummonerMatch? {
        return .init(participants: info.participants.map { $0.toDomain() })
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO {
    struct ParticipantDTO: Decodable {
        let assists: Int
        let challenges: [String: Double]
        let championID: Int
        let championName: String
        let deaths, doubleKills: Int
        let item0, item1, item2, item3, item4, item5, item6: Int
        let kills, participantID: Int
        let pentaKills: Int
        let perks: PerksDTO
        let profileIcon: Int
        let puuid: String
        let quadraKills, summoner1ID, summoner2ID: Int
        let summonerID: String
        let summonerLevel: Int
        let summonerName: String
        let teamID: Int
        let tripleKills: Int
        let win: Bool

        enum CodingKeys: String, CodingKey {
            case assists, challenges
            case championID = "championId"
            case championName, deaths, doubleKills, item0, item1, item2,
                 item3, item4, item5, item6, kills
            case participantID = "participantId"
            case pentaKills, perks, profileIcon, puuid, quadraKills
            case summoner1ID = "summoner1Id"
            case summoner2ID = "summoner2Id"
            case summonerID = "summonerId"
            case summonerLevel, summonerName
            case teamID = "teamId"
            case tripleKills, win
        }
    }

    struct TeamDTO: Decodable {
        let teamID: Int
        let win: Bool

        enum CodingKeys: String, CodingKey {
            case teamID = "teamId"
            case win
        }
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO {
    struct PerksDTO: Decodable {
        let styles: [StyleDTO]
    }

    func toDomain() -> SummonerMatch.Participant {
        return .init(
            summonerName: summonerName,
            championName: championName,
            assists: assists,
            deaths: deaths,
            kills: kills,
            win: win,
            kda: challenges["kda"] ?? 0
        )
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO {

    struct StyleDTO: Decodable {
        let styleDescription: DescriptionDTO
        let selections: [SelectionDTO]
        let style: Int

        enum CodingKeys: String, CodingKey {
            case styleDescription = "description"
            case selections, style
        }
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO.StyleDTO {
    enum DescriptionDTO: String, Decodable {
        case primaryStyle = "primaryStyle"
        case subStyle = "subStyle"
    }

    struct SelectionDTO: Decodable {
        let perk, var1, var2, var3: Int
    }
}
