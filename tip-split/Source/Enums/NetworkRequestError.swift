//
//  NetworkRequestError.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import Foundation

enum NetworkRequestError: LocalizedError, Equatable {
    
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
}

