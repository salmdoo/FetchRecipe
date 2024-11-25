//
//  RecipePageObject.swift
//  FetchRecipeUITests
//
//  Created by Salmdo on 11/21/24.
//

import XCTest

enum RecipeViewIdentifiers: String {
    case recipeImage
    case recipeName
    case recipeCuisine
    case recipeScrollList
    case errorBanner
}

struct RecipePageObject {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var recipeImage: XCUIElement {
        app.images[RecipeViewIdentifiers.recipeImage.rawValue]
    }
    
    var recipeName: XCUIElement {
        app.staticTexts[RecipeViewIdentifiers.recipeName.rawValue]
    }
    
    var recipeCuisine: XCUIElement {
        app.staticTexts[RecipeViewIdentifiers.recipeCuisine.rawValue]
    }
    
    var recipeRecipeScrollList: XCUIElement {
        app.scrollViews[RecipeViewIdentifiers.recipeScrollList.rawValue]
    }
    
    var recipeErrorBanner: XCUIElement {
        app.staticTexts[RecipeViewIdentifiers.errorBanner.rawValue]
    }
    
}
