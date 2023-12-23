//
//  MovieType.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

enum MovieType {
    case popular
    case nowPlaying
    case upComing
    case topRated
    
    var path: String {
        switch self {
        case .popular: return "/popular"
        case .nowPlaying: return "/now_playing"
        case .upComing: return "/upcoming"
        case .topRated: return "/top_rated"
        }
    }
    
    var description: String {
        switch self {
        case .popular: return "Popular"
        case .nowPlaying: return "Now Playing"
        case .upComing: return "Upcoming"
        case .topRated: return "Top Rated"
        }
    }
}
