//
//  DataDragonVersionRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/16.
//

protocol DataDragonVersionRepository {
    func fetchDataDragonInformation(completion: @escaping (Result<String, Error>) -> Void)
}
