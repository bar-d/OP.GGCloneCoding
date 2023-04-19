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
    private let cache: SummonerMatchListStorage
    
    // MARK: - Initializers
    
    init(
        repository: SummonerMatchRepository = SummonerMatchRepository(),
        cache: SummonerMatchListStorage = UserDefaultsSummonerMatchListStorage()
    ) {
        self.repository = repository
        self.cache = cache
    }
    
    // MARK: - Methods
    
    func searchSummoner(
        matchIDList: [String],
        completion: @escaping (Result<[SummonerMatch], Error>) -> Void
    ) {
        repository.fetchSummonerInformation(matchIDList: matchIDList) { result in
            switch result {
            case .success(let summonerMatchList):
                cache.save(summonerMatchList)
                completion(.success(summonerMatchList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
