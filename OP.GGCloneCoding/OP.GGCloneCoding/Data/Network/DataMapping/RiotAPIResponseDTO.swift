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

    struct MatchDTO: Decodable {
        let metadata: Metadata
        let info: InfoDTO
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

extension RiotAPIResponseDTO.MatchDTO {
    struct Metadata: Decodable {
        let dataVersion, matchID: String
        let participants: [String]

        enum CodingKeys: String, CodingKey {
            case dataVersion
            case matchID = "matchId"
            case participants
        }
    }

    struct InfoDTO: Decodable {
        let gameCreation, gameDuration, gameEndTimestamp, gameID: Int
        let gameMode, gameName: String
        let gameStartTimestamp: Int
        let gameType, gameVersion: String
        let mapID: Int
        let participants: [ParticipantDTO]
        let platformID: String
        let queueID: Int
        let teams: [TeamDTO]
        let tournamentCode: String

        enum CodingKeys: String, CodingKey {
            case gameCreation, gameDuration, gameEndTimestamp
            case gameID = "gameId"
            case gameMode, gameName, gameStartTimestamp, gameType, gameVersion
            case mapID = "mapId"
            case participants
            case platformID = "platformId"
            case queueID = "queueId"
            case teams, tournamentCode
        }
    }
extension RiotAPIResponseDTO.MatchDTO.InfoDTO {
    struct ParticipantDTO: Decodable {
        let allInPings, assistMePings, assists, baitPings: Int
        let baronKills, basicPings, bountyLevel: Int
        let challenges: [String: Double]
        let champExperience, champLevel, championID: Int
        let championName: String
        let championTransform, commandPings, consumablesPurchased, damageDealtToBuildings: Int
        let damageDealtToObjectives, damageDealtToTurrets, damageSelfMitigated, dangerPings: Int
        let deaths, detectorWardsPlaced, doubleKills, dragonKills: Int
        let eligibleForProgression: Bool
        let enemyMissingPings, enemyVisionPings: Int
        let firstBloodAssist, firstBloodKill, firstTowerAssist, firstTowerKill: Bool
        let gameEndedInEarlySurrender, gameEndedInSurrender: Bool
        let getBackPings, goldEarned, goldSpent, holdPings: Int
        let individualPosition: String
        let inhibitorKills, inhibitorTakedowns, inhibitorsLost, item0: Int
        let item1, item2, item3, item4: Int
        let item5, item6, itemsPurchased, killingSprees: Int
        let kills: Int
        let lane: String
        let largestCriticalStrike, largestKillingSpree, largestMultiKill, longestTimeSpentLiving: Int
        let magicDamageDealt, magicDamageDealtToChampions, magicDamageTaken, needVisionPings: Int
        let neutralMinionsKilled, nexusKills, nexusLost, nexusTakedowns: Int
        let objectivesStolen, objectivesStolenAssists, onMyWayPings, participantID: Int
        let pentaKills: Int
        let perks: PerksDTO
        let physicalDamageDealt, physicalDamageDealtToChampions, physicalDamageTaken, profileIcon: Int
        let pushPings: Int
        let puuid: String
        let quadraKills: Int
        let riotIDName, riotIDTagline, role: String
        let sightWardsBoughtInGame, spell1Casts, spell2Casts, spell3Casts: Int
        let spell4Casts, summoner1Casts, summoner1ID, summoner2Casts: Int
        let summoner2ID: Int
        let summonerID: String
        let summonerLevel: Int
        let summonerName: String
        let teamEarlySurrendered: Bool
        let teamID: Int
        let teamPosition: String
        let timeCCingOthers, timePlayed, totalDamageDealt, totalDamageDealtToChampions: Int
        let totalDamageShieldedOnTeammates, totalDamageTaken, totalHeal, totalHealsOnTeammates: Int
        let totalMinionsKilled, totalTimeCCDealt, totalTimeSpentDead, totalUnitsHealed: Int
        let tripleKills, trueDamageDealt, trueDamageDealtToChampions, trueDamageTaken: Int
        let turretKills, turretTakedowns, turretsLost, unrealKills: Int
        let visionClearedPings, visionScore, visionWardsBoughtInGame, wardsKilled: Int
        let wardsPlaced: Int
        let win: Bool

        enum CodingKeys: String, CodingKey {
            case allInPings, assistMePings, assists, baitPings, baronKills, basicPings, bountyLevel, challenges, champExperience, champLevel
            case championID = "championId"
            case championName, championTransform, commandPings, consumablesPurchased, damageDealtToBuildings, damageDealtToObjectives, damageDealtToTurrets, damageSelfMitigated, dangerPings, deaths, detectorWardsPlaced, doubleKills, dragonKills, eligibleForProgression, enemyMissingPings, enemyVisionPings, firstBloodAssist, firstBloodKill, firstTowerAssist, firstTowerKill, gameEndedInEarlySurrender, gameEndedInSurrender, getBackPings, goldEarned, goldSpent, holdPings, individualPosition, inhibitorKills, inhibitorTakedowns, inhibitorsLost, item0, item1, item2, item3, item4, item5, item6, itemsPurchased, killingSprees, kills, lane, largestCriticalStrike, largestKillingSpree, largestMultiKill, longestTimeSpentLiving, magicDamageDealt, magicDamageDealtToChampions, magicDamageTaken, needVisionPings, neutralMinionsKilled, nexusKills, nexusLost, nexusTakedowns, objectivesStolen, objectivesStolenAssists, onMyWayPings
            case participantID = "participantId"
            case pentaKills, perks, physicalDamageDealt, physicalDamageDealtToChampions, physicalDamageTaken, profileIcon, pushPings, puuid, quadraKills
            case riotIDName = "riotIdName"
            case riotIDTagline = "riotIdTagline"
            case role, sightWardsBoughtInGame, spell1Casts, spell2Casts, spell3Casts, spell4Casts, summoner1Casts
            case summoner1ID = "summoner1Id"
            case summoner2Casts
            case summoner2ID = "summoner2Id"
            case summonerID = "summonerId"
            case summonerLevel, summonerName, teamEarlySurrendered
            case teamID = "teamId"
            case teamPosition, timeCCingOthers, timePlayed, totalDamageDealt, totalDamageDealtToChampions, totalDamageShieldedOnTeammates, totalDamageTaken, totalHeal, totalHealsOnTeammates, totalMinionsKilled, totalTimeCCDealt, totalTimeSpentDead, totalUnitsHealed, tripleKills, trueDamageDealt, trueDamageDealtToChampions, trueDamageTaken, turretKills, turretTakedowns, turretsLost, unrealKills, visionClearedPings, visionScore, visionWardsBoughtInGame, wardsKilled, wardsPlaced, win
        }
    }

    struct TeamDTO: Decodable {
        let bans: [BanDTO]
        let objectives: ObjectivesDTO
        let teamID: Int
        let win: Bool

        enum CodingKeys: String, CodingKey {
            case bans, objectives
            case teamID = "teamId"
            case win
        }
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO {
    struct PerksDTO: Decodable {
        let statPerks: StatPerksDTO
        let styles: [StyleDTO]
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.TeamDTO {
    struct BanDTO: Decodable {
        let championID, pickTurn: Int

        enum CodingKeys: String, CodingKey {
            case championID = "championId"
            case pickTurn
        }
    }

    struct ObjectivesDTO: Decodable {
        let baron, champion, dragon, inhibitor: BaronDTO
        let riftHerald, tower: BaronDTO
    }
}

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO {
    struct StatPerksDTO: Decodable {
        let defense, flex, offense: Int
    }

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

extension RiotAPIResponseDTO.MatchDTO.InfoDTO.TeamDTO.ObjectivesDTO {
    struct BaronDTO: Decodable {
        let first: Bool
        let kills: Int
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
