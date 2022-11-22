//
//  DataDragonAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

protocol DataDragonAPIRequest: APIRequest { }

extension DataDragonAPIRequest {
    var host: URLHost {
        .dataDragon
    }
}
