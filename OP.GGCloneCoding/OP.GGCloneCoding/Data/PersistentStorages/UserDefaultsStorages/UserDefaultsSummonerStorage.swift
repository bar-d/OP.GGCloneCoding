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
    
    private func persist(_ summoner: Summoner) {
        let summonerData = try? JSONEncoder().encode(summoner)

        userDefaults.set(
            summonerData,
            forKey: Design.mySummonerInformationUserDefaultKey
        )
        
        userDefaults.set(
            true,
            forKey: Design.didSummonerSelectedUserDefaultKey
        )
    }
    
    private func fetchSummoner() -> Summoner? {
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

// MARK: Extension

extension UserDefaultsSummonerStorage: SummonerStorage {
    func save(_ summoner: Summoner) {
        persist(summoner)
    }
    
    func getResponse(completion: @escaping (Result<Summoner, Error>) -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let summoner = self?.fetchSummoner() else {
                return
            }
            
            completion(.success(summoner))
        }
    }
}

// MARK: - Namespace

private enum Design {
    static let mySummonerInformationUserDefaultKey = "MySummonerInformation"
    static let didSummonerSelectedUserDefaultKey = "DidSummonerSelected"
}
