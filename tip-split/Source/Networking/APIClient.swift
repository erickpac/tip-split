//
//  APIClient.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import Foundation
import Combine

struct APIClient {
    
    var baseURL: String = "https://jsonplaceholder.typicode.com"
    var networkDispatcher: NetworkDispatcher!
    
    init(networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
        self.networkDispatcher = networkDispatcher
    }
    
    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Fail(
                outputType: R.ReturnType.self,
                failure: NetworkRequestError.badRequest
            ).eraseToAnyPublisher()
        }
        
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        
        return requestPublisher.eraseToAnyPublisher()
    }
}
