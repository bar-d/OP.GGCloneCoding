//
//  DataDragonVersionAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import Foundation

struct DataDragonVersionAPIRequest: DataDragonAPIRequest {
    
    typealias APIResponse = [String]
    
    // MARK: Properties
    
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?
    var queryItems: [String : String]?
    
    // MARK: - Initializers
    
    init() {
        path = .version
    }
}
