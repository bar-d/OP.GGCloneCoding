//
//  DataDragonAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/16.
//

protocol DataDragonAPIRequest: APIRequest { }

extension DataDragonAPIRequest {
    var host: URLHost {
        .dataDragon
    }
}
