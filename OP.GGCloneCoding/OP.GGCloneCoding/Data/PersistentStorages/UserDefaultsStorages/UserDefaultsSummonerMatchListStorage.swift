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
            forKey: UserDefaults.Key.mySummonerMatchInformation
        )
        print(#function, fetchSummonerMatchList())
    }
    
    private func fetchSummonerMatchList() -> [SummonerMatch] {
        guard let unarchivedSummonerMatchListData = userDefaults.object(
            forKey: UserDefaults.Key.mySummonerMatchInformation
        ) as? Data,
              let summonerMatchArray = try? JSONDecoder().decode(
                [SummonerMatch].self,
                from: unarchivedSummonerMatchListData
              ) else {
            return []
        }
        
        return summonerMatchArray
        
//        let summonerMatchArray = try? JSONDecoder().decode(
//          [SummonerMatch].self,
//          from: unarchivedSummonerMatchData
//        ) else {
//      return [
//  }
//
//        guard let unarchivedSummonerMatchData = UserDefaults.standard.object(forKey: "MySummonerMatchInformation") as? Data,
//              let summonerMatchArray = try? JSONDecoder().decode(
//                [SummonerMatch].self,
//                from: unarchivedSummonerMatchData
//              ) else {
//            return
//        }
        
//        return unarchivedSummonerMatchListData
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
    
    func getSummonerMatchList() -> [SummonerMatch] {
        return fetchSummonerMatchList()
    }
}
