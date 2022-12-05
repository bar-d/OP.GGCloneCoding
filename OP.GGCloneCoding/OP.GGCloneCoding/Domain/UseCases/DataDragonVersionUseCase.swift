//
//  DataDragonVersionUseCase.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

struct DataDragonVersionUseCase {

    // MARK: Properties

    private let repository: DataDragonVersionRepository

    // MARK: - Initializers

    init(repository: DataDragonVersionRepository = DefaultDataDragonVersionRepository()) {
        self.repository = repository
    }

    // MARK: - Methods

    func searchGameVersion(completion: @escaping (Result<String, Error>) -> Void) {
        repository.fetchDataDragonInformation { result in
            switch result {
            case .success(let version):
                completion(.success(version))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
