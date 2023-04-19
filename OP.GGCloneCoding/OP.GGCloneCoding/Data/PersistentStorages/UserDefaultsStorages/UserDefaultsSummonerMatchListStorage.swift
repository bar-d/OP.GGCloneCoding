//
//  UserDefaultsSummonerMatchListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/19.
//

import Foundation

final class UserDefaultsSummonerMatchListStorage: UserDefaultsStorage {
    
    // MARK: Properties
    
    private let maxStorageLimit: Int?
    private let userDefaults: UserDefaults
    
    // MARK: - Initializers
    
    init(maxStorageLimit: Int? = 10, userDefaults: UserDefaults = .standard) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }
    
    // MARK: - Methods
    
    private func persist(_ summonerMatchList: [SummonerMatch]) {
        let summonerMatchListData = try? JSONEncoder().encode(summonerMatchList)
        userDefaults.set(
            summonerMatchListData,
            forKey: Design.mySummonerMatchInformationUserDefaultKey
        )
    }
    
    private func fetchSummonerMatchList() -> [SummonerMatch] {
        guard let unarchivedSummonerMatchListData = userDefaults.object(
            forKey: Design.mySummonerMatchInformationUserDefaultKey
        ) as? [SummonerMatch] else {
            return []
        }
        
        return unarchivedSummonerMatchListData
    }
}

// MARK: Extension

extension UserDefaultsSummonerMatchListStorage: SummonerMatchListStorage {
    func save(_ summonerMatchList: [SummonerMatch]) {
        persist(summonerMatchList)
    }
    
    func getResponse(
        maxCount: Int = 10,
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    ) {
        var matchList = fetchSummonerMatchList()
        let maxCount = (maxStorageLimit != nil) ? maxCount : 0
        let range = 0..<maxCount
        
        matchList = matchList.count <= maxCount ? matchList : Array(matchList[range])
        completion(.success(matchList))
    }
}

// MARK: - Namespace

private enum Design {
    static let mySummonerMatchInformationUserDefaultKey = "MySummonerMatchInformation"
}
