//
//  UserDefaultsAppearanceStorage.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2023/04/20.
//

import Foundation
import UIKit

final class UserDefaultsAppearanceStorage: UserDefaultsStorage {
    
    // MARK: Properties
    
    private let maxStorageLimit: Int?
    private let userDefaults: UserDefaults
    
    private let window: UIWindow? = {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        return window
    }()
    
    // MARK: - Initializers
    
    init(maxStorageLimit: Int? = nil, userDefaults: UserDefaults = .standard) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }
}

// MARK: Extension

extension UserDefaultsAppearanceStorage: AppearanceStorage {
    func setAppearanceUnspecified() {
        userDefaults.set(
            Appearance.unspecified.rawValue,
            forKey: UserDefaults.Key.appearance
        )
        window?.overrideUserInterfaceStyle = .unspecified
    }
    
    func setAppearanceLightMode() {
        userDefaults.set(Appearance.light.rawValue, forKey: UserDefaults.Key.appearance)
        window?.overrideUserInterfaceStyle = .light
    }
    
    func setAppearanceDarkmode() {
        userDefaults.set(Appearance.dark.rawValue, forKey: UserDefaults.Key.appearance)
        window?.overrideUserInterfaceStyle = .dark
    }
}
