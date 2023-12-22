//
//  PopularServiceTest.swift
//  iFoodCaseMovieTests
//
//  Created by Samuel on 21/12/23.
//

import XCTest
@testable import iFoodCaseMovie

final class PopularServiceTest: XCTest {
    var sut: PopularService!
    var netwotkMock: NetworkManagerMock!
    
    override func setUpWithError() throws {
        netwotkMock = NetworkManagerMock()
        sut = PopularService(networkManager: netwotkMock)
    }
    
    override func tearDownWithError() throws {
        netwotkMock = nil
        sut = nil
    }
    
    func testShouldLoadDataWithValidResquestValues() throws {
        let requestExpected = NetworkRequest(
            baseURL: Constants.baseUrl,
            path: MovieType.popular.path,
            method: .get,
            headers: ["Content-Type" : " application/json"],
            queryParameters: nil,
            bodyParameter: nil)
        
        sut.loadData { _ in }
        
        XCTAssertTrue(netwotkMock.didCallRequest)
        XCTAssertEqual(requestExpected.baseURL, netwotkMock.requestReceived?.baseURL)
        XCTAssertEqual(requestExpected.path, netwotkMock.requestReceived?.path)
        XCTAssertEqual(requestExpected.method, netwotkMock.requestReceived?.method)
        XCTAssertEqual(requestExpected.headers, netwotkMock.requestReceived?.headers)
    }
}
