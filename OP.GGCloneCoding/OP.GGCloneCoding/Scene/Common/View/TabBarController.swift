//
//  TabBarController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit
import SafariServices

typealias UIComponents = (UIViewController, UITabBarItem)

final class TabBarController: UITabBarController {
    
    // MARK: Properties
    
    private let arrayOfViewControllerWithTabBarItem: [UIComponents] = [
        Design.Pair.home,
        Design.Pair.champion,
        Design.Pair.esports,
        Design.Pair.community,
        Design.Pair.settings
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColor()
        setupTabBar(arrayOfViewControllerWithTabBarItem)
    }
    
    // MARK: - Methods
    
    private func setupColor() {
        tabBar.tintColor = Design.iconColor
    }
    
    private func setupTabBar(_ pair: [(UIViewController, UITabBarItem)]) {
        var viewControllerArray: [UIViewController] = []
        
        pair.forEach { (viewController, item) in
            viewController.tabBarItem = item
            viewControllerArray.append(viewController)
        }
        
        viewControllers = viewControllerArray
    }
    
    private func setupTabBarItemViewController(
        viewController: UIViewController,
        item: UITabBarItem
    ) -> UIViewController {
        viewController.tabBarItem = item
        
        return viewController
    }
}

// MARK: - Namespace

private enum Design {
    enum Pair {
        static let home = (MainViewController(), TabBarItem.home)
        static let champion = (SFSafariViewController(url: Design.URL.champion), TabBarItem.champion)
        static let esports = (SFSafariViewController(url: Design.URL.esports), TabBarItem.esports)
        static let community = (SFSafariViewController(url: Design.URL.commumity), TabBarItem.community)
        static let settings = (SettingsViewController(), TabBarItem.settings)
    }
    
    enum TabBarItem {
        static let home = UITabBarItem(
            title: "홈",
            image: UIImage(named: "HomeIcon"),
            tag: 0
        )
        static let champion = UITabBarItem(
            title: "챔피언",
            image: UIImage(named: "ChampionIcon"),
            tag: 1
        )
        static let esports = UITabBarItem(
            title: "e 스포츠",
            image: UIImage(named: "ESportsIcon"),
            tag: 2
        )
        static let community = UITabBarItem(
            title: "커뮤니티",
            image: UIImage(named: "CommunityIcon"),
            tag: 3
        )
        static let settings = UITabBarItem(
            title: "설정",
            image: UIImage(named: "SettingsIcon"),
            tag: 4
        )
    }
    
    enum URL {
        static let champion = "https://www.op.gg/champions?region=kr".url
        static let esports = "https://esports.op.gg".url
        static let commumity = "https://talk.op.gg/s/lol/all?sort=popular".url
    }
    
    static let iconColor = UIColor(named: "IconColor")
}
