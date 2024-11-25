import XCTest

@testable import ErrorShared

final class ErrorSharedTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    private func checkRestAPIError(statusCode: Int) throws {
        throw RestAPIErrorImpl.rest(statusCode: statusCode)
    }
    
    func test_given_9999_resterror_when_then_error() throws {
        // given
        let statusCode = 9999
        
        // when
        do {
            try checkRestAPIError(statusCode: statusCode)
            XCTFail("에러를 강제로 발생시켰기 때문에 성공해선 안됩니다.")
        } catch {
            guard let error = error as? RestAPIErrorImpl else {
                XCTFail("에러를 강제로 발생시켰기 때문에 성공해선 안됩니다.")
                return
            }
            
            // then
            XCTAssertTrue(
                error == .rest(statusCode: statusCode),
                "에러를 강제로 발생시켰기 때문에 성공해선 안됩니다."
            )
        }
    }
}
