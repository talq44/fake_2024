import XCTest

@testable import SelectItemDomain
@testable import SelectItemDomainTesting

final class SelectItemDomainTests: XCTestCase {
    
    private var analytics: StubAnalyticsSend!
    private var sut: SelectItemUseCaseImpl!
    
    override func setUpWithError() throws {
        self.analytics = StubAnalyticsSend()
        self.sut = SelectItemUseCaseImpl(
            analytics: self.analytics
        )
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func test_given_items_when_execute_then_sendEvent() throws {
        // given
        let items = [SelectItem.Item(
            item_id: "item_id",
            item_name: "item_name"
        )]
        
        // when
        self.sut.execute(SelectItem(
            item_list_id: "",
            item_list_name: "",
            items: items
        ))
        
        // then
        XCTAssertTrue(
            self.analytics.isSendEvent(),
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
