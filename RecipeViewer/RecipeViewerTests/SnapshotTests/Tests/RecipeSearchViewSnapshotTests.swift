//
//  RecipeSearchViewSnapshotTests.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import XCTest
import SnapshotTesting

@testable import RecipeViewer

@MainActor
final class RecipeSearchViewSnapshotTests: DefaultSnapshotTestCase {
    func testDefaultState() {
        let viewModel = RecipeViewModel()
        let view = RecipeSearchView(viewModel: viewModel)

        assertsSnapshots(matching: view)
    }

    func testLoadingState() {
        let viewModel = RecipeViewModel()
        viewModel.state = .loading
        let view = RecipeSearchView(viewModel: viewModel)

        assertsSnapshots(matching: view)
    }

    func testLoadedStateWitResults() {
        let viewModel = RecipeViewModel()
        viewModel.state = .loaded
        viewModel.recipes = [.make()]
        let view = RecipeSearchView(viewModel: viewModel)

        assertsSnapshots(matching: view)
    }

    func testLoadedStateWithoutResults() {
        let viewModel = RecipeViewModel()
        viewModel.state = .loaded
        let view = RecipeSearchView(viewModel: viewModel)

        assertsSnapshots(matching: view)
    }
}
