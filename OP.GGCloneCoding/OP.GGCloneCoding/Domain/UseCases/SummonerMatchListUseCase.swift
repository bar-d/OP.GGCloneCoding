//
//  SummonerMatchListUseCase.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/10.
//

struct SummonerMatchListUseCase {
    
    // MARK: Properties
    
    private let repository: SummonerMatchListRepository
    
    // MARK: - Initializers

    init(repository: SummonerMatchListRepository = DefaultSummonerMatchListRepository()) {
        self.repository = repository
    }
    
    // MARK: - Methods

    func searchSummonerMatch(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        repository.fetchSummonerInformation(puuid: puuid) { result in
            switch result {
            case .success(let summonerMatchList):
                completion(.success(summonerMatchList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
