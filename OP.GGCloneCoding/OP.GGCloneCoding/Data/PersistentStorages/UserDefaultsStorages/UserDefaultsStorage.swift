//
//  UserDefaultsStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/17.
//

import Foundation

protocol UserDefaultsStorage {
    init(maxStorageLimit: Int?, userDefaults: UserDefaults)
}
