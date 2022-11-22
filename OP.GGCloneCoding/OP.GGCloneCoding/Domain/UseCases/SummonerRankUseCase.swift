//
//  SummonerRankUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

struct SummonerRankUseCase {
    
    // MARK: Properties
    
    private let repository: SummonerRankRepository
    
    // MARK: - Initializers

    init(repository: SummonerRankRepository = DefaultSummonerRankRepository()) {
        self.repository = repository
    }
    
    // MARK: - Methods

    func searchSummonerRank(
        encryptedId: String,
        completion: @escaping (Result<[SummonerRank], Error>) -> Void
    ) {
        repository.fetchSummonerInformation(
            encryptedSummonerID: encryptedId
        ) {
            result in
            switch result {
            case .success(let summonerRank):
                completion(.success(summonerRank))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
