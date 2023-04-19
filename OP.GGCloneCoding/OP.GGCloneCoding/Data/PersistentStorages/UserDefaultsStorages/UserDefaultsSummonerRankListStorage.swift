//
//  UserDefaultsSummonerRankListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/20.
//

import Foundation

final class UserDefaultsSummonerRankListStorage: UserDefaultsStorage {
    
    // MARK: Properties
    
    private let maxStorageLimit: Int?
    private let userDefaults: UserDefaults
    
    // MARK: - Initializers
    
    init(maxStorageLimit: Int? = 2, userDefaults: UserDefaults = .standard) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }
    
    // MARK: - Methods
    
    private func persist(_ summonerMatchList: [SummonerRank]) {
        let summonerMatchListData = try? JSONEncoder().encode(summonerMatchList)
        userDefaults.set(
            summonerMatchListData,
            forKey: UserDefaults.Key.mySummonerRankInformation
        )
    }
    
    private func fetchSummonerRankList() -> [SummonerRank] {
        guard let unarchivedSummonerMatchListData = userDefaults.object(
            forKey: UserDefaults.Key.mySummonerRankInformation
        ) as? [SummonerRank] else {
            return []
        }
        
        return unarchivedSummonerMatchListData
    }
}

// MARK: Extension

extension UserDefaultsSummonerRankListStorage: SummonerRankListStorage {
    func save(_ summonerRankList: [SummonerRank]) {
        persist(summonerRankList)
    }
    
    func getResponse(
        maxCount: Int = 2,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        var summonerRankList = fetchSummonerRankList()
        let maxCount = (maxStorageLimit != nil) ? maxCount : 0
        let range = 0..<maxCount
        
        summonerRankList = summonerRankList.count <= maxCount ?
                            summonerRankList : Array(summonerRankList[range])
        completion(.success(summonerRankList))
    }
}
