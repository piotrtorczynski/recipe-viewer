//
//  RecipeDetailView.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//


import SwiftUI

struct RecipeDetailView: View {
    @StateObject private var viewModel: RecipeDetailViewModel

    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Display recipe image
                AsyncImage(url: URL(string: viewModel.recipe.image)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)
                .padding()

                // Recipe title
                Text(viewModel.recipe.label)
                    .font(.largeTitle)
                    .padding([.leading, .trailing, .bottom])

                // Calories and cooking time
                HStack {
                    Text(viewModel.caloriesText)
                    Text(viewModel.totalTimeText)
                }
                .font(.headline)
                .padding([.leading, .trailing, .bottom])

                // Cuisine type
                Text(viewModel.cuisineTypeText)
                    .padding([.leading, .trailing, .bottom])

                // Ingredients list
                Text("Ingredients:")
                    .font(.headline)
                    .padding(.leading)

                ForEach(viewModel.formattedIngredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding([.leading, .trailing, .bottom])
                }

                // Link to original recipe
                Link("View full recipe", destination: URL(string: viewModel.recipe.url)!)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationTitle("Recipe Details")
    }
}
