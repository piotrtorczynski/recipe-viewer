//
//  EdamamURLBuilder.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import Factory
import Networking

struct EdamamURLBuilder: APIURLBuilder {

    @Injected(\.serverEnvironmentProvider) private var serverEnvironmentProvider

    var host: String  { return serverEnvironmentProvider.environment.serverPath }
    var root: String { return "api/recipes" }

    var scheme: Scheme {
        switch serverEnvironmentProvider.initialServerEnvironment {
        case .production:
            return .https
        default:
            return .http
        }
    }

    var version: String? {
        return "v2"
    }

    var port: Int? {
        switch serverEnvironmentProvider.initialServerEnvironment {
        case .localUITest(let port):
            return port
        default:
            return nil
        }
    }
}
