//
//  DefaultDataDragonProfileIconRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

struct DefaultDataDragonProfileIconRepository {

    // MARK: Properties

    private let riotAPIService: RiotAPIService
    private let cache: SummonerStorage

    // MARK: - Initializers

    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: SummonerStorage = UserDefaultsSummonerStorage()
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = DataDragonProfileIconAPIRequest

extension DefaultDataDragonProfileIconRepository: DataDragonProfileIconRepository {
    func fetchDataDragonInformation(
        version: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        guard let summoner = cache.getSummoner() else {
            return
        }
        let iconID = String(summoner.profileIconID)
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
    
    func getSummoner() -> Summoner? {
        cache.getSummoner()
    }
}
