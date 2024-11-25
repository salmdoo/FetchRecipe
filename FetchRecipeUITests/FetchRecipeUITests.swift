//
//  FetchRecipeUITests.swift
//  FetchRecipeUITests
//
//  Created by Salmdo on 11/20/24.
//

import XCTest
import OSLog
@testable import FetchRecipe

final class FetchRecipeUITests: XCTestCase {
    fileprivate var app: XCUIApplication!
    fileprivate var recipePageObject: RecipePageObject?

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        recipePageObject = RecipePageObject(app: app)
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        recipePageObject = nil
        app = nil
        try super.tearDownWithError()
    }

    func testReturnEmptyData() throws {
        app.launchEnvironment = ["UITesting":"true", "mockServiceResult": "shouldReturnEmptyData"]
        app.launch()
        
        let scrollView = recipePageObject?.recipeRecipeScrollList
        let banner = recipePageObject?.recipeErrorBanner
        XCTAssertFalse(scrollView?.exists ?? true)
        XCTAssertTrue(banner?.exists ?? false)
        
        sleep(1)
    }
    
    func testReturnErrorMsg() throws {
        app.launchEnvironment = ["UITesting":"true", "mockServiceResult": "shouldReturnError"]
        app.launch()
        
        let scrollView = recipePageObject?.recipeRecipeScrollList
        let banner = recipePageObject?.recipeErrorBanner
        XCTAssertFalse(scrollView?.exists ?? true)
        XCTAssertTrue(banner?.exists ?? false)
        
        sleep(1)
    }
    
    func testReturnRecipes() throws {
        app.launchEnvironment = ["UITesting":"true", "mockServiceResult": "shouldReturnData"]
        app.launch()
        
        let scrollView = recipePageObject?.recipeRecipeScrollList.firstMatch
        let banner = recipePageObject?.recipeErrorBanner
        let recipeImage = recipePageObject?.recipeImage
        let recipeName = recipePageObject?.recipeName
        let recipeCuisine = recipePageObject?.recipeCuisine
        
        XCTAssertTrue(scrollView?.exists ?? false)
        XCTAssertFalse(banner?.exists ?? true)
        XCTAssertTrue(recipeImage?.exists ?? false)
        XCTAssertTrue(recipeName?.exists ?? false)
        XCTAssertTrue(recipeCuisine?.exists ?? false)
        
        sleep(1)
    }
}

