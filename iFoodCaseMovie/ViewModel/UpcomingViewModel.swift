//
//  UpcomingViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import Foundation

protocol UpcomingViewModelDelegate: AnyObject {
    func didUpdateUpcomingMovies()
    func presentUpcomingMovieDetail()
}

struct UpcomingCellItem: Hashable {
    let title: String
}

class UpcomingViewModel: ObservableObject {
    
    //MARK: - delegate protocols
    weak var delegate: UpcomingViewModelDelegate?
    
    //MARK: - private variables
    @Published
    private(set) var upcomingList: [Movie] = []
    
    //MARK: - public variables
    var upcomingItens: [UpcomingCellItem] {
        upcomingList.compactMap { upcomingMovie in
            guard let title = upcomingMovie.title else { return nil }
            return UpcomingCellItem(title: title)
        }
    }
    
    let upcomingServiceProtocol: MovieServiceProtocol
    
    //MARK: - init class
    init(upcomingServiceProtocol: MovieServiceProtocol = MovieService()) {
        self.upcomingServiceProtocol = upcomingServiceProtocol
    }
    
    //MARK: - public methods
    func fetch() {
        upcomingServiceProtocol.loadData(from: MovieType.upComing) { [weak self] result in
            switch result {
            case .success(let upcomingResult):
                self?.upcomingList = upcomingResult
                self?.delegate?.didUpdateUpcomingMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellItem(for indexPath: IndexPath) -> UpcomingCellItem {
        return upcomingItens[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        delegate?.presentUpcomingMovieDetail()
    }
}
