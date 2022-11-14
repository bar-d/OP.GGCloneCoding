//
//  SummonerMatchListUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerMatchListUseCase {
    
    // MARK: Properties
    
    private let summonerMatchListRepository: SummonerMatchListRepository
    
    // MARK: - Initializers

    init(summonerMatchListRepository: SummonerMatchListRepository = DefaultSummonerMatchListRepository()) {
        self.summonerMatchListRepository = summonerMatchListRepository
    }
    
    // MARK: - Methods

    func searchSummonerMatch(
        puuid: String,
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        summonerMatchListRepository.fetchSummonerInformation(puuid: puuid) { result in
            switch result {
            case .success(let summonerMatchList):
                completion(.success(summonerMatchList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
