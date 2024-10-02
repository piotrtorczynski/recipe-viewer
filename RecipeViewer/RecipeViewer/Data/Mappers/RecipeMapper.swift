//
//  RecipeMapper.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import Foundation

final class RecipeMapper {
    func map(response: RecipeResponseDTO) -> [Recipe] {
        response.hits.map { recipeDTo in
            Recipe(
                label: recipeDTo.recipe.label,
                image: recipeDTo.recipe.image,
                url: URL(string: recipeDTo.recipe.url),
                ingredients: recipeDTo.recipe.ingredients.map { Ingredient(quantity: $0.quantity, measure: $0.measure, food: $0.food, weight: $0.weight, foodCategory: $0.foodCategory, image: URL(string: $0.image ?? "")) },
                calories: roundCalories(value: recipeDTo.recipe.calories),
                totalTime: formatTotalTime(value: recipeDTo.recipe.totalTime),
                cuisineType: recipeDTo.recipe.cuisineType
            )

        }
    }

    private func roundCalories(value: Double) -> Double {
        (value * 1000).rounded(.toNearestOrEven)
    }

    private func formatTotalTime(value: Double?) -> String {
        if let totalTime = value, totalTime > 0 {
            return "Time: \(Int(totalTime)) min"
        } else {
            return "Time: N/A"
        }
    }
}
