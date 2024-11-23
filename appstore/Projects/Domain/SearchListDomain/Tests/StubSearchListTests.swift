//
//  StubSearchListTests.swift
//  SearchListDomainTests
//
//  Created by 박창규 on 11/23/24.
//

import XCTest

@testable import SearchListDomain
@testable import SearchListDomainTesting

final class StubSearchListTests: XCTestCase {
    
    private var sut: StubSearchListUseCase!
    
    override func setUpWithError() throws {
        self.sut = StubSearchListUseCase()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func test_give_when_execute_then_return_items() async throws {
        // given
        let term: String = "검색"
        let isMore: Bool = false
        
        let input = SearchListInputImpl(term: term, isMore: isMore)
        
        // when
        let resposne = await self.sut.execute(input)
        
        // then
        switch resposne {
        case .success(let success):
            XCTAssertTrue(
                success.items.count > 0,
                "Stub은 테스트를 위해 일부 정상적인 값을 돌려줘야 합니다."
            )
            
        case .failure:
            XCTFail("Stub은 테스트를 위해 일부 정상적인 값을 돌려줘야 합니다.")
        }
    }
    
    func test_give_100_item_when_execute_then_return_100_items() async throws {
        // given
        let term: String = "검색"
        let isMore: Bool = false
        let itemCount: Int = 100
        
        let input = SearchListInputImpl(term: term, isMore: isMore)
        self.sut.count = itemCount
        
        // when
        let resposne = await self.sut.execute(input)
        
        // then
        switch resposne {
        case .success(let success):
            XCTAssertTrue(
                success.items.count == itemCount,
                "Stub은 요청한 갯수만큼의 상품을 돌려줘야 합니다."
            )
            
        case .failure:
            XCTFail("Stub은 요청한 갯수만큼의 상품을 돌려줘야 합니다.")
        }
    }
}
