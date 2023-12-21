//
//  NetworkManagerError.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 20/12/23.
//

import Foundation

enum NetworkManagerError: Error {
    case connectionFailedWithAPI
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .connectionFailedWithAPI: return "Houve uma falha com a conexao com a API."
        case .invalidResponse: return "Nos encontramos um erro quando tentamos validar o URL disponibilizada."
        case .noData: return "Nos nao encontramos nenhum dado com os parametros disponibilizados."
        case .serializationError: return "Nos encontramos um erro ao realizar a serializacao dos dados."
        }
    }
}
