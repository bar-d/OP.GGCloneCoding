//
//  SummonerRankListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/20.
//

import Foundation

protocol SummonerRankListStorage: AnyObject {
    func save(_ summonerRankList: [SummonerRank])
    func getResponse(
        maxCount: Int,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    )
    func getSummonerRankList() -> [SummonerRank]
}
