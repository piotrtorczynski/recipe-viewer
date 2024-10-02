//
//  RecipeDTO.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import Foundation

// Recipe model to match the API response
struct RecipeDTO: Codable, Hashable {
    let label: String
    let image: String
    let url: String
    let ingredients: [IngredientDTO]
    let calories: Double
    let totalTime: Double?
    let cuisineType: [String]?
}

// Ingredient model
struct IngredientDTO: Codable, Hashable {
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory: String?
    let image: String?
}

// API response structure
struct RecipeResponseDTO: Codable {
    let hits: [RecipeHitDTO]
}

struct RecipeHitDTO: Codable {
    let recipe: RecipeDTO
}
