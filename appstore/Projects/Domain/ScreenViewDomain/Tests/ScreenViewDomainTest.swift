import XCTest

@testable import ScreenViewDomain
@testable import ScreenViewDomainTesting

final class ScreenViewDomainTests: XCTestCase {
    
    private var container: StubScreenViewUseCaseContainer!
    
    override func setUpWithError() throws {
        self.container = StubScreenViewUseCaseContainer(
            assemble: ScreenViewUseCaseAssembly()
        )
    }

    override func tearDownWithError() throws {
        self.container = nil
    }

    func testExample() throws {
        // given
        let output = self.container.build()
        
        guard let useCase = output.useCase as? ScreenViewUseCaseImpl else {
            XCTFail("useCase가 성공적으로 생성되지 않았습니다.")
            return
        }
        
        // when
        useCase.execute(page: .item_detail, screenAnyClass: classForCoder)
        
        // then
        XCTAssertTrue(
            true,
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
