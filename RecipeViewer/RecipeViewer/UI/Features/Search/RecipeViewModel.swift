//
//  RecipeViewModel.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Foundation
import Factory

@MainActor
final class RecipeViewModel: ObservableObject {
    enum State {
        case initial
        case loading
        case loaded
    }

    @Injected(\.getRecipesUseCase) private var useCase

    @Published var state: State = .initial
    @Published var recipes: [Recipe] = []

    @Published var errorMessage: String?
    @Published var searchQuery: String = ""

    func searchRecipes(query: String) async {
        state = .loading

        defer {
            state = .loaded
        }

        do {
            let results = try await useCase.getRecipes(for: query)
            recipes = results
        } catch {
            errorMessage = "Failed to fetch recipes"
        }
    }
}
