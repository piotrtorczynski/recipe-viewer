//
//  SearchRecipeUITests.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import XCTest

final class SearchRecipeUITests: UITestCase {
    private struct Paths {
        static let search = "/api/recipes/v2"
    }

    override func setUp() {
        // Stub the swifter server with relevant starting JSON returns

        server.addJSONStub(url: Paths.search, filename: "SearchResponse", method: .GET)
        // Finish configuration and start the test app
        super.setUp()
    }

    func testSelectingRecipe() {
        XCTAssertTrue(app.staticTexts["Recipes"]
            .waitForExistence(timeout: UITestTimeout.standard.rawValue))

        let searchField = app.searchFields.firstMatch

        searchField
            .tap()

        searchField.typeText("Chicken")

        app.buttons["Search"]
            .tap()

        let firstRecipe = app.staticTexts["recipe_element"].firstMatch
        XCTAssertTrue(firstRecipe.waitForExistence(timeout: UITestTimeout.standard.rawValue))
        XCTAssertTrue(firstRecipe.waitForElementToBecomeHittable(timeout: .standard))
        firstRecipe.tap()

        XCTAssertEqual(app.staticTexts["recipe_title"].label, "Dinner Tonight: Beef Miroton")
    }
}
