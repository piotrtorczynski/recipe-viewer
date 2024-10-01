//
//  MockRecipesService.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Foundation
import Networking

@testable import RecipeViewer

class MockRecipesService: RecipesServiceProtocol {
    var shouldThrowError = false
    var mockRecipes: [Recipe] = []

    func getRecipes(for query: String) async throws -> [Recipe] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return mockRecipes
    }
}
