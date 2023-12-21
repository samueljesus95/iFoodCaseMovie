//
//  MovieType.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

enum MovieType {
    case popular
    
    var path: String {
        switch self {
        case .popular: return "/popular"
        }
    }
    
    var description: String {
        switch self {
        case .popular: return "Popular"
        }
    }
}
