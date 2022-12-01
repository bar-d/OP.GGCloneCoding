//
//  DefaultSummonerRepostiory.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import CoreData

struct DefaultSummonerRepostiory: SummonerRepository {
    
    // MARK: Properties

    private let riotAPIService: RiotAPIService
    private let cache: CoreDataSummonerInformationStorage

    // MARK: - Initializers

    init(
        riotAPIService: RiotAPIService = RiotAPIService(),
        cache: CoreDataSummonerInformationStorage = CoreDataSummonerInformationStorage.shared
    ) {
        self.riotAPIService = riotAPIService
        self.cache = cache
    }
}

// MARK: - Extension

private typealias Request = RiotSummonerAPIRequest

extension DefaultSummonerRepostiory {
    func fetchSummonerInformation(
        name: String,
        completion: @escaping (Result<SummonerUnit, Error>) -> Void
    ) {
        guard let request: NSFetchRequest<SummonerInformation> = cache.fetchRequest(by: name),
              let cachedData = cache.read(by: request)?.toDTO() else {
            connectToNetwork(
                by: name,
                with: completion
            )

            return
        }

        guard let summonerInformation = cachedData.toDomain() else {
            completion(.failure(DTOError.invalidTransformation))

            return
        }

        completion(.success(summonerInformation))
    }

    private func connectToNetwork(by name: String, with completion: @escaping (Result<SummonerUnit, Error>) -> Void) {
        let summonerRequest = Request(summonerID: name)

        riotAPIService.execute(summonerRequest) { result in
            switch result {
            case .success(let response):
                cache.create(data: response)

                guard let summonerInformation = response.toDomain() else {
                    completion(.failure(DTOError.invalidTransformation))

                    return
                }

                completion(.success(summonerInformation))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
