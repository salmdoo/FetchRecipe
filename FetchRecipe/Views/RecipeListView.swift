//
//  RecipeListView.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var recipeListVM: RecipeListViewModel
    @State private var columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                if recipeListVM.isLoading {
                    VStack(spacing: 10) {
                        ProgressView()
                            .progressViewStyle(.circular)
                        Text("Loading...").font(.caption)
                    }
                }
                else {
                    BannerView(error: recipeListVM.error)
                    if !recipeListVM.recipeList.isEmpty{
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(recipeListVM.recipeList, id:\.uuid) { recipe in
                                    RecipeView(recipe: recipe)
                                }
                            }
                        }
                        .accessibilityIdentifier(RecipeViewIdentifiers.recipeScrollList.rawValue)
                    }
                }
            }
            .padding()
            .onAppear(perform: {
                recipeListVM.fetchRecipe()
                columns = getGridColums()
                startListeningOrientationChange()
            })
            .refreshable {
                recipeListVM.fetchRecipe()
            }
            .navigationTitle("Fetch Recipes")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private func startListeningOrientationChange() {
        NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: .main
        ) { _ in
            columns = getGridColums()
        }
    }
    
    private func getGridColums() -> [GridItem] {
        let orientation: UIDeviceOrientation = UIDevice.current.orientation
        if orientation.isLandscape {
            return [GridItem(.flexible()), GridItem(.flexible())]
        }
        return [GridItem(.flexible())]
    }
}

#Preview {
    RecipeListView(recipeListVM: RecipeListViewModel(serviceManagement: NetworkServiceImp(url: ""), logging: LoggingServiceImp()))
}
