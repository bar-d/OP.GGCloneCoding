//
//  DataDragonChampionIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/18.
//

import UIKit

protocol DataDragonChampionIconRepository {
    func fetchDataDragonInformation(
        version: String,
        championName: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    )
}
