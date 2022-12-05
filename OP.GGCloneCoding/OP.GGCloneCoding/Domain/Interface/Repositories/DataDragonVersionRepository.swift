//
//  DataDragonVersionRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

protocol DataDragonVersionRepository {
    func fetchDataDragonInformation(completion: @escaping (Result<String, Error>) -> Void)
}
