//
//  Recipe.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Foundation

// Recipe model to match the API response
struct Recipe: Hashable {
    let label: String
    let image: String
    let url: URL?
    let ingredients: [Ingredient]
    let calories: Double
    let totalTime: String
    let cuisineType: [String]?
}

extension Recipe: Identifiable {
    var id: String {
        image
    }
}

// Ingredient model
struct Ingredient: Codable, Hashable {
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory: String?
    let image: URL?
}
