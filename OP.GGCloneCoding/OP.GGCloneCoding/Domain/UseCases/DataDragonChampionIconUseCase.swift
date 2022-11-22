//
//  DataDragonChampionIconUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/18.
//

import UIKit

struct DataDragonChampionIconUseCase {

    // MARK: Properties

    private let repository: DataDragonChampionIconRepository

    // MARK: - Initializers

    init(repository: DataDragonChampionIconRepository = DefaultDataDragonChampionIconRepository()) {
        self.repository = repository
    }

    // MARK: - Methods

    func searchChampionIcon(
        version: String,
        championName: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        repository.fetchDataDragonInformation(version: version, championName: championName) { result in
            switch result {
            case .success(let championIcon):
                completion(.success(championIcon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
