//
//  MatchListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/19.
//

import Foundation

protocol MatchListStorage {
    func save(_ matchList: [String])
    func getResponse(completion: @escaping (Result<[String], Error>) -> Void)
}
