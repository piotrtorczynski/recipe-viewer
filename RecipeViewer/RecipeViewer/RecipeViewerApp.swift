//
//  RecipeViewerApp.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import SwiftUI
import Networking
import Factory

@main
struct AppLauncher {
    static func main() throws {
        if CommandLine.isUnitTesting {
            TestApp.main()
        } else {
            RecipeViewerApp.main()
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}

struct RecipeViewerApp: App {
    init() {
        // UITests need to be run on the localUITest serverEnvironment and have animations off
        if CommandLine.isUITesting {
        #if DEBUG
            UIView.setAnimationsEnabled(false)
            let serverEnvironmentString = ServerEnvironment.localUITest(port: CommandLine.mockServerPort).serverPath
            guard let serverEnvironment = ServerEnvironment.getServerEnv(from: serverEnvironmentString) else { return }
            var storage = Container.shared.serverEnvironmentProvider.resolve()
            storage.initialServerEnvironment = serverEnvironment
        #endif
        }
    }

    var body: some Scene {
        WindowGroup {
            RecipeSearchView()
        }
    }
}
