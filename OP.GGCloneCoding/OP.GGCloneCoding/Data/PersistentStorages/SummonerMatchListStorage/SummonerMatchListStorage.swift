//
//  SummonerMatchListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/19.
//

import Foundation

protocol SummonerMatchListStorage: AnyObject {
    func save(_ summonerMatchList: [SummonerMatch])
    func getResponse(
        maxCount: Int,
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    )
}
