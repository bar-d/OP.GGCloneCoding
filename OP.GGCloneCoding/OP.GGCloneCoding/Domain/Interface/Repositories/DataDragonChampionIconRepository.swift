//
//  DataDragonChampionIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/18.
//

import UIKit

protocol DataDragonChampionIconRepository {
    func fetchDataDragonInformation(
        version: String,
        championName: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    )
}
