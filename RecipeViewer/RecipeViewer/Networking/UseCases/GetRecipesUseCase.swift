//
//  GetRecipesUseCase.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import Foundation
import Factory

protocol GetRecipesUseCaseProtocol {
    func getRecipes(for query: String) async throws -> [Recipe]
}

final class GetRecipesUseCase: GetRecipesUseCaseProtocol {
    @Injected(\.recipesRepository) private var repository

    func getRecipes(for query: String) async throws -> [Recipe] {
        try await repository.getRecipes(for: query)
    }
}
