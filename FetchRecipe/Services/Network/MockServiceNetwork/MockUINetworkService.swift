//
//  MockUINetworkService.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/21/24.
//

import Foundation
import Combine

struct MockUINetworkService: NetworkService {
    
    enum MockServiceResult: String {
        case shouldReturnData
        case shouldReturnEmptyData
        case shouldReturnError
    }
    
    private var serviceResult: MockServiceResult
    
    init(serviceResult: String) {
        self.serviceResult = MockServiceResult(rawValue: serviceResult) ?? .shouldReturnError
    }
    
    func fetchData() -> AnyPublisher<RecipeList, any Error> {
        switch serviceResult {
        case .shouldReturnData:
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
        case .shouldReturnEmptyData:
            return Just(RecipeList(recipeList: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        default:
            return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
    }
}
