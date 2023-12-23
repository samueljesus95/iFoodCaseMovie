//
//  TopRatedViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import Foundation

protocol TopRatedViewModelDelegate: AnyObject {
    func didUpdateTopRatedMovies()
    func presentTopRatedMovieDetail()
}

struct TopRatedCellItem: Hashable {
    let title: String
}

class TopRatedViewModel: ObservableObject {
    
    //MARK: - delegate protocols
    weak var delegate: TopRatedViewModelDelegate?
    
    //MARK: - private variables
    @Published
    private(set) var topRatedList: [Movie] = []
    
    //MARK: - public variables
    var topRatedItens: [TopRatedCellItem] {
        topRatedList.compactMap { topRatedMovie in
            guard let title = topRatedMovie.title else { return nil }
            return TopRatedCellItem(title: title)
        }
    }
    
    let topRatedServiceProtocol: MovieServiceProtocol
    
    //MARK: - init class
    init(topRatedServiceProtocol: MovieServiceProtocol = MovieService()) {
        self.topRatedServiceProtocol = topRatedServiceProtocol
    }
    
    //MARK: - public methods
    func fetch() {
        topRatedServiceProtocol.loadData(from: MovieType.topRated) { [weak self] result in
            switch result {
            case .success(let topRatedResult):
                self?.topRatedList = topRatedResult
                self?.delegate?.didUpdateTopRatedMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellItem(for indexPath: IndexPath) -> TopRatedCellItem {
        return topRatedItens[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        delegate?.presentTopRatedMovieDetail()
    }
}
