//
//  DataDragonProfileIconAPIRequest.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit.UIImage

struct DataDragonProfileIconAPIRequest: DataDragonAPIRequest {
    
    typealias APIResponse = CodableImage
    
    // MARK: Properties
    
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var headers: [String : String]?
    var body: Data?
    var queryItems: [String : String]?
    
    // MARK: - Initializers
    
    init(version: String, iconID: String) {
        path = .profileIcon(version: version, iconID: iconID)
    }
}
