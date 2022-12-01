//
//  SummonerSearchUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

struct SummonerSearchUseCase {
    
    // MARK: Properties
    
    private let repository: SummonerRepository
    
    // MARK: - Initializers

    init(repository: SummonerRepository = DefaultSummonerRepostiory()) {
        self.repository = repository
    }
    
    // MARK: - Methods

    func searchSummoner(
        name: String,
        completion: @escaping (Result<SummonerUnit, Error>) -> Void
    ) {
        repository.fetchSummonerInformation(name: name) { result in
            switch result {
            case .success(let summoner):
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
