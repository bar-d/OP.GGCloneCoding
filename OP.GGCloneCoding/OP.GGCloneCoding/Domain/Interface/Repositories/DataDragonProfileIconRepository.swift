//
//  DataDragonProfileIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/16.
//

import UIKit

protocol DataDragonProfileIconRepository {
    func fetchDataDragonInformation(
        version: String,
        iconID: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    )
}
