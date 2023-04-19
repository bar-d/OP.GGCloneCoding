//
//  SummonerStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/18.
//

protocol SummonerStorage {
    func save(_ summoner: Summoner)
    func getResponse(completion: @escaping (Result<Summoner, Error>) -> Void)
}
