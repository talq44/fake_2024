import XCTest

@testable import ViewItemListDomain
@testable import ViewItemListDomainTesting

final class ViewItemListDomainTests: XCTestCase {
    
    private var analytics: StubAnalyticsCore!
    private var sut: ViewItemListUseCaseImpl!
    
    override func setUpWithError() throws {
        self.analytics = StubAnalyticsCore()
        self.sut = ViewItemListUseCaseImpl(
            analytics: self.analytics
        )
    }

    override func tearDownWithError() throws {
        self.analytics = nil
    }

    func test_give_normal_when_execute_then_analytics_send_event() throws {
        // given
        let item_list_id: String = "item_list_id"
        let item_list_name: String = "item_list_name"
        let items = [Item(item_id: "item_id", item_name: "item_name")]
        
        // when
        self.sut.execute(ViewItemListInput(
            items: items,
            item_list_id: item_list_id,
            item_list_name: item_list_name
        ))
        
        // then
        XCTAssertTrue(
            self.analytics.sendEvent != nil,
            "analytics에 성공적으로 값이 전달되어야만 한다."
        )
    }
}
