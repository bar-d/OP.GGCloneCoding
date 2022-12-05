//
//  DefaultDataDragonVersionRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import Foundation

struct DefaultDataDragonVersionRepository: DataDragonVersionRepository {
    
    // MARK: Properties
    
    private let riotAPIService: RiotAPIService
    
    // MARK: - Initializers
    
    init(riotAPIService: RiotAPIService = RiotAPIService()) {
        self.riotAPIService = riotAPIService
    }
}

// MARK: - Extension

private typealias Request = DataDragonVersionAPIRequest

extension DefaultDataDragonVersionRepository {
    func fetchDataDragonInformation(
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        let dataDragonVersionRequest = Request()
        
        riotAPIService.execute(dataDragonVersionRequest) { result in
            switch result {
            case .success(let response):
                completion(.success(response[0]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
