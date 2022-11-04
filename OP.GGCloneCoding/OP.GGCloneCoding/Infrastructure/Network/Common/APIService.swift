//
//  APIService.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

protocol APIService {
    func execute<T: APIRequest>(_ request: T, completion: @escaping (Result<T.APIResponse, APIError>) -> Void)
}

extension APIService {
    func parse<T: Decodable>(_ response: Data) -> T? {
        let parsedData = try? JSONDecoder().decode(T.self, from: response)

        return parsedData
    }
}
