//
//  SceneDelegate.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Properties

    var window: UIWindow?

    // MARK: Methods

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
