//
//  Factory.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Networking
import Factory

extension Container {
    // MARK: - API Client
    var apiClient: Factory<APIClient> {
        self { DefaultAPIClient() }
            .singleton
    }

    // MARK: Repositories

    var recipesRepository: Factory<RecipesRepositoryProtocol> {
        self { RecipesRepository() }
    }


    // MARK: Use cases

    var getRecipesUseCase: Factory<GetRecipesUseCaseProtocol> {
        self { GetRecipesUseCase() }
    }

    // MARK: - Server Environment

    var serverEnvironmentProvider: Factory<ServerEnvironmentControllerProtocol> {
        self { ServerEnvironmentController() }
    }
}
