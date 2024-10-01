//
//  APIReuqest.Extensions.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Networking

extension APIRequest {
    var urlBuilder: APIURLBuilder { EdamamURLBuilder() }
}
