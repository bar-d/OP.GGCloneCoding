//
//  RiotAPIService.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import Foundation

struct RiotAPIService: APIService {

    // MARK: Properties

    private let session: URLSession

    // MARK: - Initializers

    init(session: URLSession = standard) {
        self.session = session
    }

    // MARK: - Methods

    func execute<T>(
        _ request: T,
        completion: @escaping (Result<T.APIResponse, APIError>) -> Void
    ) where T : APIRequest {
        guard let request = request.urlRequest else {
            completion(.failure(.invalidRequest))

            return
        }

        callHandler(completion, from: request)
    }

    private func callHandler<T>(
        _ completion: @escaping (Result<T, APIError>) -> Void,
        from request: URLRequest
    ) where T: Decodable {
        session.dataTask(with: request) { data, response, error in
            if let apiError = checkAPIErrorFrom(response, error) {
                completion(.failure(apiError))
            }

            completion(checkIntegrity(of: data))
        }.resume()
    }

    private func checkAPIErrorFrom(
        _ response: URLResponse?,
        _ error: Error?
    ) -> APIError? {
        if let error = error {
            return .unknownError(error)
        }

        guard let response = response as? HTTPURLResponse else {
            return .invalidResponse
        }

        guard (200..<300).contains(response.statusCode) else {
            return .abnormalStatusCode(response.statusCode)
        }

        return nil
    }

    private func checkIntegrity<T>(of data: Data?) -> Result<T, APIError> where T: Decodable {
        guard let verifiedData = data else {
            return .failure(.emptyData)
        }

        guard let parsedData: T = parse(verifiedData) else {
            return .failure(.failedToParse)
        }

        return .success(parsedData)
    }
}

// MARK: - Extension

extension RiotAPIService {
    static let standard: URLSession = {
        let defaultConfiguration = URLSessionConfiguration.default
        defaultConfiguration.requestCachePolicy = .useProtocolCachePolicy

        return URLSession(configuration: defaultConfiguration)
    }()
}
