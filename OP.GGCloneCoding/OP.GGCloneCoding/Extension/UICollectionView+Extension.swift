//
//  UICollectionView+Extension.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/10/27.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(T.identifier) matching Type \(T.self)")
        }
        
        return cell
    }
}
