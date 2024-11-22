import XCTest

@testable import ViewItemListDomain
@testable import ViewItemListDomainTesting

final class ViewItemListDomainTests: XCTestCase {
    
    private var container: StubViewItemListContainer!
    
    override func setUpWithError() throws {
        self.container = StubViewItemListContainer(
            assemble: ViewItemListAssembly()
        )
    }

    override func tearDownWithError() throws {
        self.container = nil
    }

    func testExample() throws {
        // given
        let item_list_id: String = "item_list_id"
        let item_list_name: String = "item_list_name"
        let items = [Item(item_id: "item_id", item_name: "item_name")]
        
        guard let useCase = self.container.build() as? ViewItemListUseCaseImpl else {
            XCTFail("useCase가 성공적으로 생성되지 않았습니다.")
            return
        }
        
        // when
        useCase.execute(ViewItemListInput(
            items: items,
            item_list_id: item_list_id,
            item_list_name: item_list_name
        ))
        
        // then
        XCTAssertTrue(
            true,
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
