//
//  RecipeList.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/19/24.
//

import Foundation

struct RecipeList: Decodable {
    let recipeList: [Recipe]
    
    private enum CodingKeys: CodingKey {
        case recipes
    }
    
    init(recipeList: [Recipe]) {
        self.recipeList = recipeList
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipeList  = try container.decode([Recipe].self, forKey: .recipes)
    }
}
