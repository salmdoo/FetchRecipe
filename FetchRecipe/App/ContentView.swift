//
//  ContentView.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    var recipeListVM: RecipeListViewModel
    
    var body: some View {
        RecipeListView(recipeListVM: recipeListVM)
    }
}

#Preview {
    ContentView(recipeListVM: RecipeListViewModel(serviceManagement: NetworkServiceImp(url: ""), logging: LoggingServiceImp()))
}
