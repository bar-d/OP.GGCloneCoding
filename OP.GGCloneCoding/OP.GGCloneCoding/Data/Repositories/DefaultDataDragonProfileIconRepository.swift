//
//  DefaultDataDragonProfileIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

struct DefaultDataDragonProfileIconRepository: DataDragonProfileIconRepository {

    // MARK: Properties

    private let riotAPIService: RiotAPIService

    // MARK: - Initializers

    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

// MARK: - Extension

private typealias Request = DataDragonProfileIconAPIRequest

extension DefaultDataDragonProfileIconRepository {
    func fetchDataDragonInformation(
        version: String,
        iconID: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        let dataDragonProfileIconRequest = Request(version: version, iconID: iconID)

        riotAPIService.execute(dataDragonProfileIconRequest) { result in
            switch result {
            case .success(let response):
                guard let profileIconImage = response.image else {
                    completion(.failure(DTOError.invalidTransformation))

                    return
                }

                completion(.success(profileIconImage))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
