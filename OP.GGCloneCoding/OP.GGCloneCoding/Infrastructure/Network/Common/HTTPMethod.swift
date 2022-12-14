//
//  HTTPMethod.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
//

enum HTTPMethod {
    case get
    case post
    case delete
    case patch

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        }
    }
}
