//
//  MockNetworkService.swift
//  FetchRecipeTests
//
//  Created by Salmdo on 11/20/24.
//

import Foundation
import Combine
@testable import FetchRecipe

struct MockNetworkServiceUnitTest: NetworkService {
    
    var shouldReturnError = false
    var shouldReturnEmptyData = false
    
    func fetchData() -> AnyPublisher<RecipeList, any Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
        if shouldReturnEmptyData {
            return Just(RecipeList(recipeList: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        let recipe =  Recipe(cuisine: "Malaysian",
                             name: "Apam",
                             photo_url_large: "https://",
                             photo_url_small: "https://",
                             source_url: "https://",
                             uuid: "0c6",
                             youtube_url: "https://")
        return Just(RecipeList(recipeList: [recipe]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
