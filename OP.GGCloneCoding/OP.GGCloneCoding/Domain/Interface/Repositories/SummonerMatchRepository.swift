//
//  SummonerMatchRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/15.
//

protocol SummonerMatchRepository {
    func fetchSummonerInformation(
        matchIDList: [String],
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    )
}
