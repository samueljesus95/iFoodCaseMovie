//
//  PopularViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

protocol PopularViewModelDelegate: AnyObject {
    func didUpdatePopularMovies()
    func presentPopularMovieDetail()
}

struct CellItem: Hashable {
    let title: String
}

class PopularViewModel: ObservableObject {
    
    //MARK: - delegate protocols
    weak var delegate: PopularViewModelDelegate?
    
    //MARK: - private variables
    @Published
    private(set) var popularList: [Movie] = []
    
    //MARK: - public variables
    var popularItens: [CellItem] {
        popularList.compactMap { popularMovie in
            guard let title = popularMovie.title else { return nil }
            return CellItem(title: title)
        }
    }
    
    let popularServiceProtocol: PopularServiceProtocol
    
    //MARK: - init class
    init(popularServiceProtocol: PopularServiceProtocol = PopularService()) {
        self.popularServiceProtocol = popularServiceProtocol
    }
    
    //MARK: - public methods
    func fetch() {
        popularServiceProtocol.loadData { [weak self] result in
            switch result {
            case .success(let popularResult):
                self?.popularList = popularResult
                self?.delegate?.didUpdatePopularMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellItem(for indexPath: IndexPath) -> CellItem {
        return popularItens[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        delegate?.presentPopularMovieDetail()
    }
}
