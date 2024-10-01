//
//  GetRecipesRequest.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Foundation
import Networking

struct GetRecipesRequest: APIRequest {
    typealias ReturnType = RecipeResponse

    var path: String { "" }

    private let searchQuery: String

    init(searchQuery: String) {
        self.searchQuery = searchQuery
    }

    var query: [URLQueryItem]? {
        [
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "q", value: searchQuery),
            URLQueryItem(name: "app_id", value: "df7edbab"),
            URLQueryItem(name: "app_key", value: "088c50c1a294edc63d5ef255b0433f18"),
            URLQueryItem(name: "imageSize", value: "THUMBNAIL"),
            URLQueryItem(name: "field", value: "uri"),
            URLQueryItem(name: "field", value: "label"),
            URLQueryItem(name: "field", value: "image"),
            URLQueryItem(name: "field", value: "url"),
            URLQueryItem(name: "field", value: "ingredients"),
            URLQueryItem(name: "field", value: "calories"),
            URLQueryItem(name: "field", value: "totalTime"),
            URLQueryItem(name: "field", value: "cuisineType")
        ]
    }
}
