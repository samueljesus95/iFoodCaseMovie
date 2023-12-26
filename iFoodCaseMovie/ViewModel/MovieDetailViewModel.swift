//
//  MovieDetailViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 25/12/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    //MARK: - private variables
    @Published
    private(set) var movieDetail: Movie?
    
    let movieDetailServiceProtocol: MovieServiceProtocol
    
    //MARK: - init class
    init(movieDetailServiceProtocol: MovieServiceProtocol = MovieService()) {
        self.movieDetailServiceProtocol = movieDetailServiceProtocol
    }
    
    //MARK: - public methods
    func fetch(_ movieId: Int) {
        movieDetailServiceProtocol.loadData(id: movieId, from: MovieType.popular) { [weak self] result in
            switch result {
            case .success(let movieResult):
                self?.movieDetail = movieResult
            case .failure(let error):
                print(error)
            }
        }
    }
}
