//
//  IngredientBuilder.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

@testable import RecipeViewer
import Foundation

extension Ingredient {
    static func make(
        quantity: Double = 2,
        measure: String? = "clove",
        food: String = "garlic",
        weight: Double = 6,
        foodCategory: String? = "vegetables",
        image: URL? = URL(string: "https://www.edamam.com/food-img/6ee/6ee142951f48aaf94f4312409f8d133d.jpg")
    ) -> Self {
        .init(
            quantity: quantity,
            measure: measure,
            food: food,
            weight: weight,
            foodCategory: foodCategory,
            image: image
        )
    }
}
