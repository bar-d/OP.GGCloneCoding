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

    init(repository: SummonerRepository = DefaultSummonerRepository()) {
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
    
    func getSummoner() -> Summoner? {
        return repository.getSummoner()
    }
}
