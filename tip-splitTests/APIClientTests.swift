//
//  APIClientTests.swift
//  tip-splitTests
//
//  Created by Linder Anderson Hassinger Solano    on 6/09/22.
//

import XCTest
import Combine

@testable import tip_split

class APIClientTests: XCTestCase {

    var apiClient: APIClient!
    private var cancellables = [AnyCancellable]()
    
    override func setUpWithError() throws {
        apiClient = APIClient()
    }

    override func tearDownWithError() throws { }

    func testExample() throws {
        var posts = [Post]()
        var error: Error?
        let expectation = self.expectation(description: "Test Posts")
        
        apiClient
            .dispatch(Posts())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let networkError):
                    error = networkError
                }
                
            } receiveValue: { data in
                data.forEach { post in
                    posts.append(post)
                }
                
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
        XCTAssertNil(error)
        XCTAssert(posts.count == 100)
    }


}
