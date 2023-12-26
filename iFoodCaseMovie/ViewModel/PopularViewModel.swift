//
//  PopularViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

protocol PopularViewModelDelegate: AnyObject {
    func didUpdatePopularMovies()
}

struct PopularCellItem: Hashable {
    let id: Int
    let title: String
}

class PopularViewModel: ObservableObject {
    
    //MARK: - delegate protocols
    weak var delegate: PopularViewModelDelegate?
    
    //MARK: - private variables
    @Published
    private(set) var popularList: [Movie] = []
    
    //MARK: - public variables
    var popularItens: [PopularCellItem] {
        popularList.compactMap { popularMovie in
            guard let id = popularMovie.id, let title = popularMovie.title else { return nil }
            return PopularCellItem(id: id, title: title)
        }
    }
    
    let popularServiceProtocol: MovieServiceProtocol
    
    //MARK: - init class
    init(popularServiceProtocol: MovieServiceProtocol = MovieService()) {
        self.popularServiceProtocol = popularServiceProtocol
    }
    
    //MARK: - public methods
    func fetch() {
        popularServiceProtocol.loadData(from: MovieType.popular) { [weak self] result in
            switch result {
            case .success(let popularResult):
                self?.popularList = popularResult
                self?.delegate?.didUpdatePopularMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellItem(for indexPath: IndexPath) -> PopularCellItem {
        return popularItens[indexPath.row]
    }
}
