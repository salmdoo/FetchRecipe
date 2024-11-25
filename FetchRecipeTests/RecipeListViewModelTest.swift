//
//  RecipeListViewModel.swift
//  FetchRecipeTests
//
//  Created by Salmdo on 11/20/24.
//

import XCTest
import Combine
//import OSLog
@testable import FetchRecipe

final class RecipeListViewModelTest: XCTestCase {
    
    fileprivate var mockService: MockNetworkService!
    lazy var recipeListVM: RecipeListViewModel = {
        RecipeListViewModel(serviceManagement: mockService!, logging: LoggingServiceImp())
    }()
    
    override func setUpWithError() throws {
        super.setUp()
        mockService = MockNetworkService()
    }


    override func tearDown() {
        mockService = nil
        super.tearDown()
    }

    func testFetchDataSuccessWithData() throws {
        
        recipeListVM.fetchRecipe()
        XCTAssertFalse(self.recipeListVM.isLoading)
        XCTAssertTrue(self.recipeListVM.error == .none)
        XCTAssertEqual(self.recipeListVM.recipeList.count, 1)
        
    }
    
    func testFetchDataSuccessWithEmptyData() throws {
        mockService?.shouldReturnEmptyData = true
        recipeListVM.fetchRecipe()
        XCTAssertFalse(self.recipeListVM.isLoading)
        XCTAssertTrue(self.recipeListVM.error == .noData)
        XCTAssertEqual(self.recipeListVM.recipeList.count, 0)
    }
    
    func testFetchDataFailure() throws {
        mockService?.shouldReturnError = true
        recipeListVM.fetchRecipe()
        
        XCTAssertFalse(self.recipeListVM.isLoading)
        XCTAssertTrue(self.recipeListVM.error == .generalError)
        XCTAssertEqual(self.recipeListVM.recipeList.count, 0)
    }

}
