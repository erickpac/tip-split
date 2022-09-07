//
//  Post.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import Foundation

struct Post: Codable {
    
    var title: String?
    var body: String?
}

struct Posts: Request {
    
    typealias ReturnType = [Post]
    var path: String = "/posts"
}
