//
//  InfoEntity.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/02.
//

import Foundation

public class InfoEntity: NSObject, NSCoding, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    let gameCreation, gameDuration, gameEndTimestamp: Int
    let gameMode: String
    let gameStartTimestamp: Int
    let participants: [ParticipantEntity]
    let queueID: Int
    let teams: [TeamEntity]

    init(gameCreation: Int, gameDuration: Int, gameEndTimestamp: Int, gameMode: String, gameStartTimestamp: Int, participants: [ParticipantEntity], queueID: Int, teams: [TeamEntity]) {
        self.gameCreation = gameCreation
        self.gameDuration = gameDuration
        self.gameEndTimestamp = gameEndTimestamp
        self.gameMode = gameMode
        self.gameStartTimestamp = gameStartTimestamp
        self.participants = participants
        self.queueID = queueID
        self.teams = teams
    }

    public required init?(coder: NSCoder) {
        gameCreation = coder.decodeInteger(forKey: "gameCreation")
        gameDuration = coder.decodeInteger(forKey: "gameDuration")
        gameEndTimestamp = coder.decodeInteger(forKey: "gameEndTimestamp")
        gameMode = coder.decodeObject(forKey: "gameMode") as? String ?? ""
        gameStartTimestamp = coder.decodeInteger(forKey: "gameStartTimestamp")
        participants = coder.decodeObject(forKey: "participants") as? [ParticipantEntity] ?? []
        queueID = coder.decodeInteger(forKey: "queueID")
        teams = coder.decodeObject(forKey: "teams") as? [TeamEntity] ?? []
    }

    public func encode(with coder: NSCoder) {
        coder.encode(gameCreation, forKey: "gameCreation")
        coder.encode(gameDuration, forKey: "gameDuration")
        coder.encode(gameEndTimestamp, forKey: "gameEndTimestamp")
        coder.encode(gameMode, forKey: "gameMode")
        coder.encode(gameStartTimestamp, forKey: "gameStartTimestamp")
        coder.encode(participants, forKey: "participants")
        coder.encode(queueID, forKey: "queueID")
        coder.encode(teams, forKey: "teams")
    }
}

extension InfoEntity {
    @objc(ParticipantEntity)
    public class ParticipantEntity: NSObject, NSCoding, NSSecureCoding {
        public static var supportsSecureCoding: Bool = true
        let assists: Int
        let challenges: [String: Double]
        let championID: Int
        let championName: String
        let deaths, doubleKills: Int
        let item0, item1, item2, item3, item4, item5, item6: Int
        let kills, participantID: Int
        let pentaKills: Int
        let perks: PerksEntity
        let profileIcon: Int
        let puuid: String
        let quadraKills, summoner1ID, summoner2ID: Int
        let summonerID: String
        let summonerLevel: Int
        let summonerName: String
        let teamID: Int
        let tripleKills: Int
        let win: Bool

        init(assists: Int, challenges: [String : Double], championID: Int, championName: String, deaths: Int, doubleKills: Int, item0: Int, item1: Int, item2: Int, item3: Int, item4: Int, item5: Int, item6: Int, kills: Int, participantID: Int, pentaKills: Int, perks: PerksEntity, profileIcon: Int, puuid: String, quadraKills: Int, summoner1ID: Int, summoner2ID: Int, summonerID: String, summonerLevel: Int, summonerName: String, teamID: Int, tripleKills: Int, win: Bool) {
            self.assists = assists
            self.challenges = challenges
            self.championID = championID
            self.championName = championName
            self.deaths = deaths
            self.doubleKills = doubleKills
            self.item0 = item0
            self.item1 = item1
            self.item2 = item2
            self.item3 = item3
            self.item4 = item4
            self.item5 = item5
            self.item6 = item6
            self.kills = kills
            self.participantID = participantID
            self.pentaKills = pentaKills
            self.perks = perks
            self.profileIcon = profileIcon
            self.puuid = puuid
            self.quadraKills = quadraKills
            self.summoner1ID = summoner1ID
            self.summoner2ID = summoner2ID
            self.summonerID = summonerID
            self.summonerLevel = summonerLevel
            self.summonerName = summonerName
            self.teamID = teamID
            self.tripleKills = tripleKills
            self.win = win
        }

        public required init?(coder: NSCoder) {
            assists = coder.decodeInteger(forKey: "assists")
            challenges = coder.decodeObject(forKey: "challenges") as? [String: Double] ?? [:]
            championID = coder.decodeInteger(forKey: "championID")
            championName = coder.decodeObject(forKey: "championName") as? String ?? ""
            deaths = coder.decodeInteger(forKey: "deaths")
            doubleKills = coder.decodeInteger(forKey: "doubleKills")
            item0 = coder.decodeInteger(forKey: "item0")
            item1 = coder.decodeInteger(forKey: "item1")
            item2 = coder.decodeInteger(forKey: "item2")
            item3 = coder.decodeInteger(forKey: "item3")
            item4 = coder.decodeInteger(forKey: "item4")
            item5 = coder.decodeInteger(forKey: "item5")
            item6 = coder.decodeInteger(forKey: "item6")
            kills = coder.decodeInteger(forKey: "kills")
            participantID = coder.decodeInteger(forKey: "participantID")
            pentaKills = coder.decodeInteger(forKey: "pentaKills")
            perks = coder.decodeObject(forKey: "perks") as! PerksEntity
            profileIcon = coder.decodeInteger(forKey: "profileIcon")
            puuid = coder.decodeObject(forKey: "puuid") as? String ?? ""
            quadraKills = coder.decodeInteger(forKey: "quadraKills")
            summoner1ID = coder.decodeInteger(forKey: "summoner1ID")
            summoner2ID = coder.decodeInteger(forKey: "summoner2ID")
            summonerID = coder.decodeObject(forKey: "summonerID") as? String ?? ""
            summonerLevel = coder.decodeInteger(forKey: "summonerLevel")
            summonerName = coder.decodeObject(forKey: "summonerName") as? String ?? ""
            teamID = coder.decodeInteger(forKey: "teamID")
            tripleKills = coder.decodeInteger(forKey: "tripleKills")
            win = coder.decodeBool(forKey: "win")
        }

        public func encode(with coder: NSCoder) {
            coder.encode(assists, forKey: "assists")
            coder.encode(challenges, forKey: "challenges")
            coder.encode(championID, forKey: "championID")
            coder.encode(championName, forKey: "championName")
            coder.encode(deaths, forKey: "deaths")
            coder.encode(doubleKills, forKey: "doubleKills")
            coder.encode(item0, forKey: "item0")
            coder.encode(item1, forKey: "item1")
            coder.encode(item2, forKey: "item2")
            coder.encode(item3, forKey: "item3")
            coder.encode(item4, forKey: "item4")
            coder.encode(item5, forKey: "item5")
            coder.encode(item6, forKey: "item6")
            coder.encode(kills, forKey: "kills")
            coder.encode(participantID, forKey: "participantID")
            coder.encode(pentaKills, forKey: "pentaKills")
            coder.encode(perks, forKey: "perks")
            coder.encode(profileIcon, forKey: "profileIcon")
            coder.encode(puuid, forKey: "puuid")
            coder.encode(quadraKills, forKey: "quadraKills")
            coder.encode(summoner1ID, forKey: "summoner1ID")
            coder.encode(summoner2ID, forKey: "summoner2ID")
            coder.encode(summonerID, forKey: "summonerID")
            coder.encode(summonerLevel, forKey: "summonerLevel")
            coder.encode(summonerName, forKey: "summonerName")
            coder.encode(teamID, forKey: "teamID")
            coder.encode(tripleKills, forKey: "tripleKills")
            coder.encode(win, forKey: "win")
        }
    }

    @objc(TeamEntity)public class TeamEntity: NSObject, NSCoding, NSSecureCoding {
        public static var supportsSecureCoding: Bool = true
        let teamID: Int
        let win: Bool

        init(teamID: Int, win: Bool) {
            self.teamID = teamID
            self.win = win
        }

        public required init?(coder: NSCoder) {
            teamID = coder.decodeInteger(forKey: "teamID")
            win = coder.decodeBool(forKey: "win")
        }

        public func encode(with coder: NSCoder) {
            coder.encode(teamID, forKey: "teamID")
            coder.encode(win, forKey: "win")
        }
    }
}

extension InfoEntity.ParticipantEntity {
    @objc(PerksEntity)public class PerksEntity: NSObject, NSCoding, NSSecureCoding {
        public static var supportsSecureCoding: Bool = true
        let styles: [StyleEntity]

        init(styles: [StyleEntity]) {
            self.styles = styles
        }

        public required init?(coder: NSCoder) {
            styles = coder.decodeObject(forKey: "styles") as? [StyleEntity] ?? []
        }

        public func encode(with coder: NSCoder) {
            coder.encode(styles, forKey: "styles")
        }
    }
}

extension InfoEntity.ParticipantEntity.PerksEntity {
    @objc(StyleEntity) public class StyleEntity: NSObject, NSCoding, NSSecureCoding {
        public static var supportsSecureCoding: Bool = true
        let styleDescription: String
        let selections: [SelectionEntity]
        let style: Int

        init(styleDescription: String, selections: [SelectionEntity], style: Int) {
            self.styleDescription = styleDescription
            self.selections = selections
            self.style = style
        }

        public required init?(coder: NSCoder) {
            styleDescription = coder.decodeObject(forKey: "styleDescription") as? String ?? ""
            selections = coder.decodeObject(forKey: "selections") as? [SelectionEntity] ?? []
            style = coder.decodeInteger(forKey: "style")
        }

        public func encode(with coder: NSCoder) {
            coder.encode(styleDescription, forKey: "styleDescription")
            coder.encode(selections, forKey: "selections")
            coder.encode(style, forKey: "style")
        }
    }
}

extension InfoEntity.ParticipantEntity.PerksEntity.StyleEntity {
    @objc(SelectionEntity)public class SelectionEntity: NSObject, NSCoding, NSSecureCoding {
        public static var supportsSecureCoding: Bool = true
        let perk, var1, var2, var3: Int

        init(perk: Int, var1: Int, var2: Int, var3: Int) {
            self.perk = perk
            self.var1 = var1
            self.var2 = var2
            self.var3 = var3
        }
        public required init?(coder: NSCoder) {
            perk = coder.decodeInteger(forKey: "perk")
            var1 = coder.decodeInteger(forKey: "var1")
            var2 = coder.decodeInteger(forKey: "var2")
            var3 = coder.decodeInteger(forKey: "var3")
        }

        public func encode(with coder: NSCoder) {
            coder.encode(perk, forKey: "perk")
            coder.encode(var1, forKey: "var1")
            coder.encode(var2, forKey: "var2")
            coder.encode(var3, forKey: "var3")
        }
    }
}
