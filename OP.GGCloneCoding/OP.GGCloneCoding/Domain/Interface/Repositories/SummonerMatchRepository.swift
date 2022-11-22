//
//  SummonerMatchRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/15.
//

protocol SummonerMatchRepository {
    func fetchSummonerInformation(
        matchIDList: [String],
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    )
}
