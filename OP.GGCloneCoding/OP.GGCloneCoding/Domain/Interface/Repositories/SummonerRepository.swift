//
//  SummonerRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

protocol SummonerRepository {
    func fetchSummonerInformation(
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    )
    func getSummoner() -> Summoner?
}
