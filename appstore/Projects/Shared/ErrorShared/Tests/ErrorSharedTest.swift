import XCTest

@testable import ErrorShared

final class ErrorSharedTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testExample() {
        let error = RestAPIErrorImpl.rest(statusCode: 400)
        print(error)
        print(error.localizedDescription)
        
        XCTAssertEqual(1, 1)
    }
}
