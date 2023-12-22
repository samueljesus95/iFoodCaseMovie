//
//  PopularServiceMock.swift
//  iFoodCaseMovieTests
//
//  Created by Samuel on 20/12/23.
//

import Foundation
@testable import iFoodCaseMovie

class PopularServiceMock: PopularServiceProtocol {
    var didCallLoadData = false
    var isSuccess = false
    var mockResult: [Popular] = PopularMock.popularWithOneMovie.results
    
    func loadData(completion: @escaping (Result<[iFoodCaseMovie.Popular], Error>) -> Void) {
        didCallLoadData = true
        isSuccess ? completion(.success(mockResult)) : completion(.failure(iFoodCaseMovie.NetworkManagerError.connectionFailedWithAPI))
    }
}
