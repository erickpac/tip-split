//
//  NetworkDispatcher.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import Foundation
import Combine

struct NetworkDispatcher {
    
    let urlSession: URLSession!
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    /// Dispatches an URLRequest and returns a publisher
    /// - Parameter request: URLRequest
    /// - Returns: A publisher with the provided decoded data or an error
    func dispatch<ReturnType: Codable>(request: URLRequest) -> AnyPublisher<ReturnType, NetworkRequestError> {
        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap { data, response in
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    throw httpError(response.statusCode)
                }
                
                return data
            }
            .decode(type: ReturnType.self, decoder: JSONDecoder())
            .mapError { error in
                handleError(error)
            }
            .eraseToAnyPublisher()
    }
}
