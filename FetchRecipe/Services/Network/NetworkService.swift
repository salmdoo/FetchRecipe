//
//  NetworkService.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/23/24.
//

import Foundation
import Combine

protocol NetworkService {
    func fetchData() -> AnyPublisher<RecipeList, Error>
}
