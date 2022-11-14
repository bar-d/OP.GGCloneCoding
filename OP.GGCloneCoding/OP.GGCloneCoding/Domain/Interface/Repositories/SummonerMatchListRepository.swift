//
//  SummonerMatchListRepository.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/10.
//

protocol SummonerMatchListRepository {
    func fetchSummonerInformation(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    )
}
