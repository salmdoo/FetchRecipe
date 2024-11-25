//
//  RecipeView.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack (alignment: .leading){
            KFImage(recipe.imageURL)
                .resizable()
                .onFailureImage(UIImage(named: "large.jpg"))
                .frame(height: 250)
                .scaledToFit()
                .accessibilityIdentifier(RecipeViewIdentifiers.recipeImage.rawValue)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 5)
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .accessibilityIdentifier(RecipeViewIdentifiers.recipeName.rawValue)
                Text(recipe.cuisine)
                    .font(.footnote)
                    .accessibilityIdentifier(RecipeViewIdentifiers.recipeCuisine.rawValue)

            }
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
            .padding(.leading, 15)
            .background(.white)
            .shadow(radius: 10)
            .padding(EdgeInsets(top: -35, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
    }
}

#Preview {
    RecipeView(recipe: PreviewRecipe.sampleRecipe)
}
