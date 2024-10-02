//
//  RecipesService.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Networking
import Factory

protocol RecipesRepositoryProtocol {
    func getRecipes(for query: String) async throws -> [Recipe]
}

final class RecipesRepository: RecipesRepositoryProtocol {

    @Injected(\.apiClient) private var apiClient

    func getRecipes(for query: String) async throws -> [Recipe] {
        let request = GetRecipesRequest(searchQuery: query)
        let response = try await apiClient.perform(request: request)
        let mapper = RecipeMapper()
        return mapper.map(response: response)
    }
}
