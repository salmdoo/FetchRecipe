//
//  ServiceError.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/19/24.
//

import Foundation
import Combine

enum ServiceError: Error {
    case invalidURL
    case badServerResponse
    case generalError
    case noData
    case none
    
    var errorMessage: String? {
        switch self {
        case .badServerResponse: "The server returned an invalid response \n Please try again later"
        case .invalidURL: "The requested URL is invalid \n Please check the URL and try again"
        case .generalError: "An unexpected error occurred \n Please try again"
        case .noData: "No data was received from the server \n Please try again"
        case .none: nil
        }
    }
}
