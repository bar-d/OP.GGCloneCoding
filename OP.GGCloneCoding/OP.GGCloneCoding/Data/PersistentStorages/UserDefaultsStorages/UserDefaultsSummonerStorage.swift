//
//  UserDefaultsSummonerStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/17.
//

import Foundation

final class UserDefaultsSummonerStorage: UserDefaultsStorage {
    
    // MARK: Properties
    
    private let maxStorageLimit: Int?
    private let userDefaults: UserDefaults
    
    // MARK: - Initializers
    
    init(maxStorageLimit: Int? = nil, userDefaults: UserDefaults = .standard) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }
    
    // MARK: - Methods
    
    func persist(_ summoner: Summoner) {
        let summonerData = try? JSONEncoder().encode(summoner)

        userDefaults.set(
            summonerData,
            forKey: Design.mySummonerInformationUserDefaultKey
        )
    }
}

extension UserDefaultsSummonerStorage: SummonerStorage {
    func save(_ summoner: Summoner) {
        persist(summoner)
    }
    
    func fetchSummoner() -> Summoner? {
        guard let unarchivedSummonerData = userDefaults.object(
            forKey: Design.mySummonerInformationUserDefaultKey
        ) as? Data,
              let summoner = try? JSONDecoder().decode(
                Summoner.self, from: unarchivedSummonerData
              ) else {
            return nil
        }
        
        return summoner
    }
}

// MARK: - Namespace

private enum Design {
    static let mySummonerInformationUserDefaultKey = "MySummonerInformation"
}
