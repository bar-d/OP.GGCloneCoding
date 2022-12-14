//
//  DataDragonProfileIconUseCase.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/16.
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
        iconID: String,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        repository.fetchDataDragonInformation(
            version: version,
            iconID: iconID
        ) { result in
            switch result {
            case .success(let profileIcon):
                completion(.success(profileIcon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
