//
//  NetworkManagerMock.swift
//  iFoodCaseMovieTests
//
//  Created by Samuel on 20/12/23.
//

import Foundation
@testable import iFoodCaseMovie

class NetworkManagerMock: NetworkManagerProtocol {
    typealias T = Codable
    
    var requestReceived: NetworkRequest?
    var didCallRequest = false
    var isSucess = false
    var mockResult: T?
    
    func request<T>(_ request: iFoodCaseMovie.NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        didCallRequest = true
        requestReceived = request
        
        isSucess ? completion(.success(mockResult as! T)) : completion(.failure(Error.self as! Error))
    }
}
