//
//  MatchListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/19.
//

import Foundation

protocol MatchListStorage: AnyObject {
    func save(_ matchList: [String])
    func getResponse(
        maxCount: Int,
        completion: @escaping (Result<[String], Error>) -> Void
    )
    func getSummonerMatchIDList() -> [String]
}
