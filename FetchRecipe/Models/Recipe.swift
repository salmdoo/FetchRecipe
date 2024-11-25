//
//  Recipe.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import Foundation

struct Recipe: Decodable {
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let uuid: String
    let youtube_url: String?
    
    var imageURL: URL? {
        URL(string: photo_url_small ??  photo_url_large ?? "")
    }
}
