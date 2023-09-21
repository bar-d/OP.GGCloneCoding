//
//  SummonerRankRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

protocol SummonerRankRepository {
    func fetchSummonerInformation(
        encryptedSummonerID: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    )
    func getSummonerRankList() -> [SummonerRank]
}
