//
//  FullRecipeView.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//


import WebKit
import SwiftUI

struct FullRecipeView: View {
    let recipeURL: URL?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            if let url = recipeURL {
                WebView(url: url)
                    .navigationTitle("Full Recipe")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }
            } else {
                Text("No URL available")
                    .navigationTitle("Full Recipe")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }
            }
        }
    }
}
