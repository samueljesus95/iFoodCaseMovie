//
//  PopularServiceMock.swift
//  iFoodCaseMovieTests
//
//  Created by Samuel on 20/12/23.
//

import Foundation
@testable import iFoodCaseMovie

class MovieServiceMock: MovieServiceProtocol {
    var didCallLoadData = false
    var isSuccess = false
    var mockResult: [Movie] = MovieMock.popularWithOneMovie.results
    
    func loadData(from endPoint: MovieType,completion: @escaping (Result<[iFoodCaseMovie.Movie], Error>) -> Void) {
        didCallLoadData = true
        isSuccess ? completion(.success(mockResult)) : completion(.failure(iFoodCaseMovie.NetworkManagerError.connectionFailedWithAPI))
    }
}
