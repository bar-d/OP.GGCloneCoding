//
//  DefaultDataDragonChampionIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/18.
//

import UIKit

struct DefaultDataDragonChampionIconRepository: DataDragonChampionIconRepository {

    // MARK: Properties

    private let riotAPIService: RiotAPIService

    // MARK: - Initializers

    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

// MARK: - Extension

private typealias Request = DataDragonChampionIconAPIRequest

extension DefaultDataDragonChampionIconRepository {
    func fetchDataDragonInformation(
        version: String,
        championName: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        let dataDragonChampionIconRequest = Request(version: version, championName: championName)

        riotAPIService.execute(dataDragonChampionIconRequest) { result in
            switch result {
            case .success(let response):
                guard let championIconImage = response.image else {
                    completion(.failure(DTOError.invalidTransformation))

                    return
                }

                completion(.success(championIconImage))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
