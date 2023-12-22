//
//  PopularViewModelTest.swift
//  iFoodCaseMovieTests
//
//  Created by Samuel on 21/12/23.
//

import XCTest
@testable import iFoodCaseMovie

final class PopularViewModelTest: XCTestCase {
    
    var sut: PopularViewModel!
    var popularServiceMock: PopularServiceMock!

    override func setUpWithError() throws {
        popularServiceMock = PopularServiceMock()
        sut = PopularViewModel(popularServiceProtocol: popularServiceMock)
    }

    override func tearDownWithError() throws {
        popularServiceMock = nil
        sut = nil
    }
    
    func testShouldCallLoadData() throws {
        sut.fetch()
        XCTAssertTrue(popularServiceMock.didCallLoadData)
    }
    
    func testShouldLoadDataWithOneMovie() {
        popularServiceMock.isSuccess = true
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 1)
    }
}
