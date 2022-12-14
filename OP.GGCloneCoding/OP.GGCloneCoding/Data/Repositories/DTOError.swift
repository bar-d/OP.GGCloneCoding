//
//  DTOError.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
//

import Foundation

enum DTOError: LocalizedError {
    case invalidTransformation

    var errorDescription: String {
        switch self {
        case .invalidTransformation:
            return "Can not transform Data Transfer Object into Domain Object."
        }
    }
}
