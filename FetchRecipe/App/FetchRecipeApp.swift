//
//  FetchRecipeApp.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import SwiftUI

@main
struct FetchRecipeApp: App {
    
    private var serviceManagement: NetworkService
    @State var recipeListVM: RecipeListViewModel
    
    init() {
        if ProcessInfo.processInfo.environment["UITesting"] == "true",
        let mockServiceResult = ProcessInfo.processInfo.environment["mockServiceResult"] {
            serviceManagement = MockUINetworkService(serviceResult: mockServiceResult)
        } else {
            serviceManagement = NetworkServiceImp(url: APIConfig.url(for: .allRecipes))
        }
        recipeListVM = RecipeListViewModel(serviceManagement: serviceManagement , logging: LoggingServiceImp())
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(recipeListVM: recipeListVM)
        }
    }
}
