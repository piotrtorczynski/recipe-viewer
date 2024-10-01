//
//  RecipeViewModelTests.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import XCTest
import Factory

@testable import RecipeViewer

@MainActor
final class RecipeViewModelTests: XCTestCase {

    var viewModel: RecipeViewModel!
    var mockRecipesService: MockRecipesService!

    override func setUp() {
        super.setUp()
        Container.shared.reset()
        Container.shared.recipesService.register {
            self.mockRecipesService
        }
        mockRecipesService = MockRecipesService()
        viewModel = RecipeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        mockRecipesService = nil
        super.tearDown()
    }

    // Test for successful recipe search
    func testSearchRecipes_Success() async {
        // Arrange
        let expectedRecipes: [Recipe] = [.make()]
        mockRecipesService.mockRecipes = expectedRecipes

        // Act
        await viewModel.searchRecipes(query: "test")

        // Assert
        XCTAssertEqual(viewModel.state, .loaded, "ViewModel state should be `.loaded` after fetching")
        XCTAssertEqual(viewModel.recipes.count, expectedRecipes.count, "Recipes count should match the expected number of recipes")
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
    }

    // Test for error case
    func testSearchRecipes_Failure() async {
        // Arrange
        mockRecipesService.shouldThrowError = true

        // Act
        await viewModel.searchRecipes(query: "test")

        // Assert
        XCTAssertEqual(viewModel.state, .loaded, "ViewModel state should still be `.loaded` after failure")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes array should be empty after failure")
        XCTAssertEqual(viewModel.errorMessage, "Failed to fetch recipes", "Error message should be set on failure")
    }

    // Test if the state transitions to `.loading` during fetch
    func testSearchRecipes_StateTransition() async {
        // Arrange
        let expectationLoading = expectation(description: "State should be `.loading` while fetching recipes")
        
        // Observe state changes
        let cancellable = viewModel.$state.sink { state in
            if state == .loading {
                expectationLoading.fulfill()
            }
        }

        // Act
        await viewModel.searchRecipes(query: "test")

        // Assert
        await fulfillment(of: [expectationLoading])
        cancellable.cancel()
        XCTAssertEqual(viewModel.state, .loaded, "State should be `.loaded` after fetching")
    }
}
