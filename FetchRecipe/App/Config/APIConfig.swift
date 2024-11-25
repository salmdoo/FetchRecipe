//
//  APIConfig.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/23/24.
//

import Foundation

struct APIConfig {
    static let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net"
    
    static func url(for endpoint: Endpoint) -> String {
        return "\(baseURL)/\(endpoint.rawValue)"
    }
    
    enum Endpoint: String {
        case allRecipes = "recipes.json"
        case malformedData = "recipes-malformed.json"
        case emptyData = "recipes-empty.json"
    }
}
