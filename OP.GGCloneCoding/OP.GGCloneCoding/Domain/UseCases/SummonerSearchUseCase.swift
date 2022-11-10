//
//  SummonerSearchUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

struct SummonerSearchUseCase {
    private let summonerRepository: SummonerRepository

    init(summonerRepository: SummonerRepository = DefaultSummonerRepostiory()) {
        self.summonerRepository = summonerRepository
    }

    func searchSummoner(id: String, completion: @escaping (Result<Summoner, Error>) -> Void) {
        summonerRepository.fetchSummonerInformation(id: id) { result in
            switch result {
            case .success(let summoner):
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

