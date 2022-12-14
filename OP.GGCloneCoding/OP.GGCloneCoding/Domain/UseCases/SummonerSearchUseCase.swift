//
//  SummonerSearchUseCase.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
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
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        repository.fetchSummonerInformation(id: id) { result in
            switch result {
            case .success(let summoner):
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
