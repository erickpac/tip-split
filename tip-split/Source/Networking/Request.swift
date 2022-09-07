//
//  Request.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import Foundation
import Combine

public protocol Request {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var contentType : String { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
    associatedtype ReturnType: Codable
}

