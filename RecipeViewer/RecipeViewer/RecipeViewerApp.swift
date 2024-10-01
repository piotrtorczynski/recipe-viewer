//
//  RecipeViewerApp.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

import SwiftUI

@main
struct AppLauncher {
    static func main() throws {
//        if CommandLine.isUnitTesting {
//            TestApp.main()
//        } else {
            RecipeViewerApp.main()
//        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}

struct RecipeViewerApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeSearchView()
        }
    }
}
