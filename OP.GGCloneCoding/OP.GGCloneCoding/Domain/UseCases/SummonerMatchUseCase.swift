//
//  SummonerMatchUseCase.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/15.
//

struct SummonerMatchUseCase {
    
    typealias SummonerMathcRepository = DefaultSummonerMatchRepository
    
    // MARK: Properties
    
    private let repository: SummonerMatchRepository
    
    // MARK: - Initializers
    
    init(repository: SummonerMatchRepository = SummonerMathcRepository()) {
        self.repository = repository
    }
    
    // MARK: - Methods
    
    func searchSummoner(
        matchIDList: [String],
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    ) {
        repository.fetchSummonerInformation(matchIDList: matchIDList) { result in
            switch result {
            case .success(let summoner):
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
