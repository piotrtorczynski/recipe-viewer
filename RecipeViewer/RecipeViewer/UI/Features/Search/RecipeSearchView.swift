//
//  RecipeSearchView.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import SwiftUI

struct RecipeSearchView: View {
    @StateObject var viewModel = RecipeViewModel()

    // Use a stack to manage navigation
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                makeErrorView()
                switch viewModel.state {
                case .initial, .loaded:
                    if viewModel.recipes.isEmpty {
                        ContentUnavailableView("No recipes",
                                               systemImage: "square.and.arrow.down",
                                               description: Text("Please use search to find your recipes"))
                    } else {
                        makeListView()
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
                RecipeDetailView(recipe: recipe)
            }
            .navigationTitle("Recipes")
        }
    }

    @ViewBuilder func makeErrorView() -> some View {
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }

    @ViewBuilder func makeListView() -> some View {
        List(viewModel.recipes) { recipe in
            RecipeRowView(recipe: recipe)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: viewModel.recipes)
                .onTapGesture {
                    navigationPath.append(recipe)
                }
                .accessibilityIdentifier("recipe_element")
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
                    ProgressView()
                        .frame(height: 200)
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.label)
                    .font(.title2)
                    .bold()

                Text(recipe.totalTime)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

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

