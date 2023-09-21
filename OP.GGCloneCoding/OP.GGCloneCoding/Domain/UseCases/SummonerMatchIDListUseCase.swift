//
//  SummonerMatchIDListUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerMatchIDListUseCase {
    
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
    
    func getMatchIDList() -> [String] {
        return repository.getSummonerMatchIDList()
    }
}
