//
//  RecipeDetailViewModel.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//


import Foundation

@MainActor
class RecipeDetailViewModel: ObservableObject {
    @Published var recipe: Recipe
    @Published var formattedIngredients: [String] = []

    init(recipe: Recipe) {
        self.recipe = recipe
        self.formatIngredients()
    }

    // Formats ingredients for display in the view
    private func formatIngredients() {
        formattedIngredients = recipe.ingredients.map { ingredient in
            let quantity = String(format: "%.2f", ingredient.quantity)
            let measure = ingredient.measure ?? ""
            return "\(quantity) \(measure) of \(ingredient.food)"
        }
    }

    // Computed property for calories
    var caloriesText: String {
        return "Calories: \(Int(recipe.calories))"
    }

    // Computed property for total cooking time
    var totalTimeText: String {
        if let totalTime = recipe.totalTime, totalTime > 0 {
            return "Time: \(Int(totalTime)) min"
        } else {
            return "Time: N/A"
        }
    }

    // Computed property for cuisine type
    var cuisineTypeText: String {
        if let cuisine = recipe.cuisineType?.first {
            return "Cuisine: \(cuisine.capitalized)"
        } else {
            return "Cuisine: N/A"
        }
    }
}
