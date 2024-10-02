import SnapshotTesting
import SwiftUI
import UIKit
import XCTest

func assertsSnapshots<Value: View>(matching value: @autoclosure () throws -> Value,
                                          precision: Float = 1.0,
                                          file: StaticString = #file,
                                          testName: String = #function,
                                          line: UInt = #line) {
    assertSnapshot(of: try value(),
                   as: .image(precision: precision,
                              perceptualPrecision: defaultPerceptualPrecision,
                              layout: .device(config: .iPhone13)),
                   file: file,
                   testName: testName,
                   line: line)
}

///   perceptualPrecision: The percentage a pixel must match the source pixel to be considered a match.
///   [98-99% mimics the precision of the human eye.](http://zschuessler.github.io/DeltaE/learn/#toc-defining-delta-e)
private let defaultPerceptualPrecision: Float = {
#if arch(x86_64)
    // When executing on Intel (CI machines) lower the `defaultPerceptualPrecision` to 98% which avoids failing tests
    // due to imperceivable differences in anti-aliasing, shadows, and blurs between Intel and Apple Silicon Macs.
    return 0.98
#else
    // The snapshots were generated on Apple Silicon Macs, so they match 100%.
    return 1.0
#endif
}()

/// Protocol for Provider and Experience Module snapshot tests.
public protocol SnapshotTestCase {
    /// Performs setup logic prior to running a snapshot test.
    func setUpSnapshotTests()

    /// Performs tear down logic after running a snapshot test.
    func tearDownSnapshotTests()
}

extension SnapshotTestCase {
    public func setUpSnapshotTests() {
        CommandLine.arguments.append("isSnapshotTesting")
        
        UIView.setAnimationsEnabled(false)
        UIApplication.shared.getKeyWindow()?.layer.speed = 100
    }

    public func tearDownSnapshotTests() {
        UIView.setAnimationsEnabled(true)
        UIApplication.shared.getKeyWindow()?.layer.speed = 1.0
        CommandLine.arguments.removeAll(where: { $0 == "isSnapshotTesting" })
    }
}

extension UIApplication {
    func getKeyWindow() -> UIWindow? {
        connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first
    }
}
