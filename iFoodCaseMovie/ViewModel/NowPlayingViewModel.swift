//
//  NowPlayingViewModel.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import Foundation

protocol NowPlayingViewModelDelegate: AnyObject {
    func didUpdateNowPlayingMovies()
    func presentNowPlayingMovieDetail()
}

struct NowPlayingCellItem: Hashable {
    let title: String
}

class NowPlayingViewModel: ObservableObject {
    
    //MARK: - delegate protocols
    weak var delegate: NowPlayingViewModelDelegate?
    
    //MARK: - private variables
    @Published
    private(set) var nowPlayingList: [Movie] = []
    
    //MARK: - public variables
    var nowPlayingItens: [NowPlayingCellItem] {
        nowPlayingList.compactMap { nowPlayingMovie in
            guard let title = nowPlayingMovie.title else { return nil }
            return NowPlayingCellItem(title: title)
        }
    }
    
    let nowPlayingServiceProtocol: MovieServiceProtocol
    
    //MARK: - init class
    init(nowPlayingServiceProtocol: MovieServiceProtocol = MovieService()) {
        self.nowPlayingServiceProtocol = nowPlayingServiceProtocol
    }
    
    //MARK: - public methods
    func fetch() {
        nowPlayingServiceProtocol.loadData(from: MovieType.nowPlaying) { [weak self] result in
            switch result {
            case .success(let nowPlayingResult):
                self?.nowPlayingList = nowPlayingResult
                self?.delegate?.didUpdateNowPlayingMovies()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellItem(for indexPath: IndexPath) -> NowPlayingCellItem {
        return nowPlayingItens[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        delegate?.presentNowPlayingMovieDetail()
    }
}
