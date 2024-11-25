import XCTest

@testable import ScreenViewDomain
@testable import ScreenViewDomainTesting

final class ScreenViewDomainTests: XCTestCase {
    
    private var analytics: StubAnalyticsSend!
    private var sut: ScreenViewUseCaseImpl!
    
    override func setUpWithError() throws {
        self.analytics = StubAnalyticsSend()
        
        self.sut = ScreenViewUseCaseImpl(
            analytics: self.analytics
        )
    }

    override func tearDownWithError() throws {
        self.analytics = nil
        self.sut = nil
    }

    func test_given_normal_when_execute_then_send() throws {
        // given
        
        // when
        self.sut.execute(page: .item_detail, screenAnyClass: classForCoder)
        
        // then
        XCTAssertTrue(
            self.analytics.isSend,
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
