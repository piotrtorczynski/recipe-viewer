//
//  Recipe.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Foundation

// Recipe model to match the API response
struct Recipe: Codable, Hashable {
    let label: String
    let image: String
    let url: String
    let ingredients: [Ingredient]
    let calories: Double
    let totalTime: Double?
    let cuisineType: [String]?
}

extension Recipe: Identifiable {
    var id: String {
        url
    }
}


// Ingredient model
struct Ingredient: Codable, Hashable {
    let text: String?
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory: String?
    let image: String?
}

// API response structure
struct RecipeResponse: Codable {
    let hits: [RecipeHit]
}

struct RecipeHit: Codable {
    let recipe: Recipe
}
