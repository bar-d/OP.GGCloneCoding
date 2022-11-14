//
//  SummonerMatchListUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/10.
//

struct SummonerMatchListUseCase {
    private let summonerMatchListRepository: SummonerMatchListRepository

    init(summonerMatchListRepository: SummonerMatchListRepository = DefaultSummonerMatchListRepository()) {
        self.summonerMatchListRepository = summonerMatchListRepository
    }

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
