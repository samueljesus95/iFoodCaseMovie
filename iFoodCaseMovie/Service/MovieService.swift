//
//  PopularService.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

protocol MovieServiceProtocol {
    func loadData(from enPoint: MovieType, completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MovieService: MovieServiceProtocol {
    
    //MARK: - private variables
    private let networkManager: NetworkManagerProtocol
    
    //MARK: - init class
    init(networkManager: NetworkManagerProtocol = DefaultNetworkService()) {
        self.networkManager = networkManager
    }
    
    //MARK: - public methods
    func loadData(from endPoint: MovieType, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let request = NetworkRequest(
            baseURL: Constants.baseUrl,
            path: endPoint.path,
            method: .get,
            headers: ["Content-Type" : "application/json"],
            queryParameters: ["api_key" : Constants.apiKey],
            bodyParameter: nil)
        
        networkManager.request(request) { (_ result: Result<MovieResult, Error>) in
            switch result {
            case .success(let popular):
                completion(.success(popular.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
