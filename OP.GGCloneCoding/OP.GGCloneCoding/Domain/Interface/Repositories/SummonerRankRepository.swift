//
//  SummonerRankRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/10.
//

protocol SummonerRankRepository {
    func fetchSummonerInformation(
        encryptedSummonerID: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    )
}
