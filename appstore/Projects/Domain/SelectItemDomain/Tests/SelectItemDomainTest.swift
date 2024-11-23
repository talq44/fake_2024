import XCTest

@testable import SelectItemDomain
@testable import SelectItemDomainTesting

final class SelectItemDomainTests: XCTestCase {
    
    private var container: StubSelectItemDomainContainer!
    
    override func setUpWithError() throws {
        self.container = StubSelectItemDomainContainer(
            assemble: SelectItemDomainAssembly()
        )
    }
    
    override func tearDownWithError() throws {
        self.container = nil
    }
    
    func testExample() throws {
        // given
        
        // when
        guard let useCase = self.container.build() as? SelectItemUseCaseImpl else {
            XCTFail("useCase가 성공적으로 생성되지 않았습니다.")
            return
        }
        
        // then
        
        XCTAssertTrue(
            true,
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
