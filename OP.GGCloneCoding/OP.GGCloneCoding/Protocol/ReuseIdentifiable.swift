//
//  ReuseIdentifiable.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/10/26.
//

import UIKit

protocol ReuseIdentifiable {
    static var identifier: String { get }
}

extension ReuseIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReuseIdentifiable { }
extension UITableViewCell: ReuseIdentifiable { }
