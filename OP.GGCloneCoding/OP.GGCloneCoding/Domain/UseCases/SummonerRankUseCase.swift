//
//  SummonerRankUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerRankUseCase {
    
    // MARK: Properties
    
    private let summonerRankRepository: SummonerRankRepository
    
    // MARK: - Initializers

    init(summonerRankRepository: SummonerRankRepository = DefaultSummonerRankRepository()) {
        self.summonerRankRepository = summonerRankRepository
    }
    
    // MARK: - Methods

    func searchSummonerRank(
        encryptedId: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        summonerRankRepository.fetchSummonerInformation(encryptedSummonerID: encryptedId) { result in
            switch result {
            case .success(let summonerRank):
                completion(.success(summonerRank))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
