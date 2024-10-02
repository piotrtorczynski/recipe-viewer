//
//  RecipeDetailsSnapshotTests.swift
//  RecipeViewerTests
//
//  Created by Piotr Torczynski on 02/10/2024.
//

import XCTest
import SnapshotTesting

@testable import RecipeViewer

final class RecipeDetailsSnapshotTests: DefaultSnapshotTestCase {
    func testView() {
        let view = RecipeDetailView(recipe: .make())

        assertsSnapshots(matching: view)
    }
}
