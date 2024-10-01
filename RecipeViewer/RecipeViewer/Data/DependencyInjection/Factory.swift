//
//  Factory.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Networking
import Factory

extension Container {
    var apiClient: Factory<APIClient> {
        self { DefaultAPIClient() }
            .singleton
    }

    var recipesService: Factory<RecipesServiceProtocol> {
        self { RecipesService() }
    }

    var serverEnvironmentProvider: Factory<ServerEnvironmentControllerProtocol> {
        self { ServerEnvironmentController() }
    }
}
