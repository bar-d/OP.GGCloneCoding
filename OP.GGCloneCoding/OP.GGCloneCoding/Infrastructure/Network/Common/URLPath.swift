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

    var url: String {
        switch self {
        case .summoner(let summonerID):
            return "/lol/summoner/v4/summoners/by-name/\(summonerID)"
        case .league(let encryptedSummonerID):
            return "/lol/league/v4/entries/by-summoner/\(encryptedSummonerID)"
        case .matchList(let puuid):
            return "/lol/match/v5/matches/by-puuid/\(puuid)/ids"
        case .match(let matchID):
            return "/lol/match/v4/matches/\(matchID)"
        case .spectator(let encryptedSummonerID):
            return "/lol/spectator/v4/active-games/by-summoner/\(encryptedSummonerID)"
        }
    }
}
