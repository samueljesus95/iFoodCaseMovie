//
//  NetworkRequestError.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

enum NetworkRequestError: Error {
    case couldNotGetURLComponent
    case couldNotCreateURL
    
    public var description: String {
        switch self {
        case .couldNotGetURLComponent: return "Nos encontramos um erro com a baseURL ou o caminho indicado."
        case .couldNotCreateURL: return "Nos encontramos um erro quando tentamos criar a URL com os parametros informados."
        }
    }
}
