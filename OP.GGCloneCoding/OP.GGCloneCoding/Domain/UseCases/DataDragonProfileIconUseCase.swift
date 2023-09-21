//
//  DataDragonProfileIconUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

struct DataDragonProfileIconUseCase {
    
    typealias ProfileIconRepository = DefaultDataDragonProfileIconRepository
    
    // MARK: Properties
    
    private let repository: DataDragonProfileIconRepository
    
    // MARK: - Initializers
    
    init(repository: DataDragonProfileIconRepository = ProfileIconRepository()) {
        self.repository = repository
    }
    
    // MARK: - Methods
    
    func searchProfileIcon(
        version: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        repository.fetchDataDragonInformation(version: version) { result in
            switch result {
            case .success(let profileIcon):
                completion(.success(profileIcon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSummoner() -> Summoner? {
        return repository.getSummoner()
    }
}
