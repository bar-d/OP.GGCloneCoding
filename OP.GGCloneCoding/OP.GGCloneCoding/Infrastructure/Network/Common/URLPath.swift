//
//  URLPath.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

enum URLPath {
    case summoner(summonerID: String)
    case league(encryptedSummonerID: String)
    case matchList(puuid: String)
    case match(matchID: String)
    case spectator(encryptedSummonerID: String)
    case version
    case profileIcon(version: String, iconID: String)
    case championIcon(version: String, championName: String)

    var url: String {
        switch self {
        case .summoner(let summonerID):
            return "/lol/summoner/v4/summoners/by-name/\(summonerID)"
        case .league(let encryptedSummonerID):
            return "/lol/league/v4/entries/by-summoner/\(encryptedSummonerID)"
        case .matchList(let puuid):
            return "/lol/match/v5/matches/by-puuid/\(puuid)/ids"
        case .match(let matchID):
            return "/lol/match/v5/matches/\(matchID)"
        case .spectator(let encryptedSummonerID):
            return "/lol/spectator/v4/active-games/by-summoner/\(encryptedSummonerID)"
        case .version:
            return "/api/versions.json"
        case .profileIcon(let version, let iconID):
            return "/cdn/\(version)/img/profileicon/\(iconID).png"
        case .championIcon(let version, let championName):
            return "/cdn/\(version)/img/champion/\(championName).png"
        }
    }
}
