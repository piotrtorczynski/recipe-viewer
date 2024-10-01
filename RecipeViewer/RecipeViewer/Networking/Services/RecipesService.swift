//
//  RecipesService.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Networking
import Factory

protocol RecipesServiceProtocol {
    func getRecipes(for query: String) async throws -> [Recipe]
}

final class RecipesService: RecipesServiceProtocol {

    @Injected(\.apiClient) private var apiClient

    func getRecipes(for query: String) async throws -> [Recipe] {
        let request = GetRecipesRequest(searchQuery: query)
        let response = try await apiClient.perform(request: request)
        return response.hits.map { $0.recipe }
    }
}
