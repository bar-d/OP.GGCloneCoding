//
//  DataDragonChampionIconAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/18.
//

import Foundation

struct DataDragonChampionIconAPIRequest: DataDragonAPIRequest {
    typealias APIResponse = CodableImage

    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?
    var queryItems: [String : String]?

    init(version: String, championName: String) {
        path = .championIcon(version: version, championName: championName)
    }
}
