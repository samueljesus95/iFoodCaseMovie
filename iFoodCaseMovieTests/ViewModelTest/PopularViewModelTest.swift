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
    var popularServiceMock: MovieServiceMock!

    override func setUpWithError() throws {
        popularServiceMock = MovieServiceMock()
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
    
    func testShouldLoadDataWithTwoMovies() {
        popularServiceMock.isSuccess = true
        popularServiceMock.mockResult = MovieMock.popularWithTwoMovie.results
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 2)
    }
    
    func testShouldLoadDataWithFailure() {
        sut.fetch()
        XCTAssertEqual(sut.popularItens.count, 0)
    }
}
