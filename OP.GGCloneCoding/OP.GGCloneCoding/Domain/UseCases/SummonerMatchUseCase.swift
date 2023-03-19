//
//  SummonerMatchUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/15.
//

struct SummonerMatchUseCase {
    
    typealias SummonerMatchRepository = DefaultSummonerMatchRepository
    
    // MARK: Properties
    
    private let repository: SummonerMatchRepository
    
    // MARK: - Initializers
    
    init(repository: SummonerMatchRepository = SummonerMatchRepository()) {
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
