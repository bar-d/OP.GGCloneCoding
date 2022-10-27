//
//  PositionTabBarDelegate.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import Foundation

protocol PositionTabBarDelegate: AnyObject {
    func scrollTabBar(to index: IndexPath)
}
