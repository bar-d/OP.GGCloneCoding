//
//  UserDefaultsMatchListStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/19.
//

import Foundation

final class UserDefaultsMatchListStorage: UserDefaultsStorage {
    
    // MARK: Properties
    
    private let maxStorageLimit: Int?
    private let userDefaults: UserDefaults
    
    // MARK: - Initializers
    
    init(maxStorageLimit: Int? = 10, userDefaults: UserDefaults = .standard) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }
    
    // MARK: - Methods
    
    private func persist(_ matchList: [String]) {
        let matchListData = try? JSONEncoder().encode(matchList)
        userDefaults.set(
            matchListData,
            forKey: UserDefaults.Key.mySummonerMatchIDListInformation
        )
    }
    
    private func fetchMatchList() -> [String] {
        guard let unarchivedMatchListData = userDefaults.object(
            forKey: UserDefaults.Key.mySummonerMatchIDListInformation
        ) as? [String] else {
            return []
        }
        
        return unarchivedMatchListData
    }
}

// MARK: Extension

extension UserDefaultsMatchListStorage: MatchListStorage {
    func save(_ matchList: [String]) {
        persist(matchList)
    }
    
    func getResponse(
        maxCount: Int = 10,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        DispatchQueue.main.async { [weak self] in
            guard var matchList = self?.fetchMatchList(),
                  let maxCount = self?.maxStorageLimit else {
                return
            }
            let range = 0..<maxCount
            
            matchList = matchList.count <= maxCount ? matchList : Array(matchList[range])
            completion(.success(matchList))
        }
    }
}
