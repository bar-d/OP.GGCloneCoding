//
//  APIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

protocol APIRequest {
    associatedtype APIResponse: Decodable

    var host: URLHost { get }
    var path: URLPath? { get set }
    var queryItems: [String: String]? { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

extension APIRequest {
    private var url: URL? {
        guard let path = path else {
            return nil
        }

        var urlComponents = URLComponents(string: host.url + path.url)
        urlComponents?.queryItems = queryItems?.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        return urlComponents?.url
    }

    var urlRequest: URLRequest? {
        guard let url = url else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.name
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body

        return urlRequest
    }
}
