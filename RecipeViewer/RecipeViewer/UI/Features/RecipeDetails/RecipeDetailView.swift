//
//  RecipeDetailView.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//


import SwiftUI

struct RecipeDetailView: View {
    @StateObject private var viewModel: RecipeDetailViewModel
    @State private var isShowingFullRecipe = false

    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Recipe Image
                if let imageURL = viewModel.imageURL {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        default:
                            Color.gray
                                .frame(height: 250)
                                .cornerRadius(10)
                        }
                    }
                }

                // Recipe Title and Metadata
                Text(viewModel.recipeTitle)
                    .font(.title)
                    .fontWeight(.bold)

                Text(viewModel.totalTimeText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(viewModel.cuisineTypeText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Full Recipe Button
                Button("View Full Recipe") {
                    isShowingFullRecipe = true
                }
                .font(.headline)
                .foregroundColor(.blue)

                // Ingredients Section
                Section(header: Text("Ingredients").font(.headline)) {
                    ForEach(viewModel.formattedIngredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .padding(.vertical, 2)
                    }
                }

                // Calories Information
                Text(viewModel.caloriesText)
                    .font(.subheadline)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isShowingFullRecipe) {
            FullRecipeView(recipeURL: viewModel.recipeURL)
        }
    }
}
