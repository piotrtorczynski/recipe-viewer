//
//  RecipeSearchView.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import SwiftUI

struct RecipeSearchView: View {
    @StateObject private var viewModel = RecipeViewModel()

    // Use a stack to manage navigation
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                switch viewModel.state {
                case .initial, .loaded:
                    if viewModel.recipes.isEmpty {
                        ContentUnavailableView("No recipes",
                                               systemImage: "square.and.arrow.down",
                                               description: Text("Please use search to find your recipes"))
                    } else {
                        List(viewModel.recipes) { recipe in
                            // Programmatically navigate to the detail view when tapped
                            Button {
                                navigationPath.append(recipe) // Pushes the recipe onto the stack
                            } label: {
                                RecipeRowView(recipe: recipe)
                            }
                        }
                    }
                case .loading:
                    ProgressView()
                }
            }
            .searchable(text: $viewModel.searchQuery, prompt: "Look for recipe")
            .onSubmit(of: .search) {
                Task { await viewModel.searchRecipes(query: viewModel.searchQuery) }
            }
            .navigationDestination(for: Recipe.self) { recipe in
                // Destination view when a recipe is tapped
                RecipeDetailView(recipe: recipe)
            }
            .padding()
            .navigationTitle("Recipes")
        }
    }
}

private struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            // Recipe image
            if let imageUrl = URL(string: recipe.image) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                } placeholder: {
                    // Placeholder while the image is loading
                    ProgressView()
                        .frame(height: 200)
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                // Recipe title
                Text(recipe.label)
                    .font(.title2)
                    .bold()

                // Display total time
                if let totalTime = recipe.totalTime, totalTime > 0 {
                    let text = String(format: "Total Time: %2.f min", totalTime)
                    Text(text)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Text("Time: N/A")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // Cuisine type as a tag
                if let cuisineType = recipe.cuisineType?.first {
                    HStack {
                        Text(cuisineType.capitalized)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
            }
            .padding(.vertical, 8)
        }
        .padding(.vertical, 8)
    }
}

