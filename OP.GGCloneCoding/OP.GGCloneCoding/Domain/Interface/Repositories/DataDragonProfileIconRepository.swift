//
//  DataDragonProfileIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

protocol DataDragonProfileIconRepository {
    func fetchDataDragonInformation(
        version: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    )
    func getSummoner() -> Summoner?
}
