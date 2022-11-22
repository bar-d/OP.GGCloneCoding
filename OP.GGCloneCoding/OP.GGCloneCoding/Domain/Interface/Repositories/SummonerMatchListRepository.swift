//
//  SummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

protocol SummonerMatchListRepository {
    func fetchSummonerInformation(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    )
}
