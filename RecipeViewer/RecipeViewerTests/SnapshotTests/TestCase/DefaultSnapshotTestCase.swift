import XCTest

class DefaultSnapshotTestCase: XCTestCase, SnapshotTestCase {
    override func setUp() {
        super.setUp()

        setUpSnapshotTests()
    }

    override func tearDown() {
        tearDownSnapshotTests()

        super.tearDown()
    }
}
