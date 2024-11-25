import XCTest

@testable import SearchListDomain
@testable import SearchListDomainTesting

final class SearchListDomainTests: XCTestCase {
    
    private var repository: StubRepository!
    private var sut: SearchListUseCaseImpl!
    
    override func setUpWithError() throws {
        self.repository = StubRepository()
        self.sut = SearchListUseCaseImpl(
            repository: self.repository
        )
    }

    override func tearDownWithError() throws {
        self.repository = nil
        self.sut = nil
    }

    func test_given_normal_when_execute_fetch_then_hasItems() async throws {
        // given
        let term: String = "검색어"
        
        // when
        let response = await self.sut.execute(SearchListInputImpl(
            term: term,
            isMore: false
        ))
        
        // then
        switch response {
        case .success:
            XCTAssertTrue(true)
            
        case .failure:
            XCTFail("정상적인 요청의 경우 error가 발생해선 안됩니다.")
        }
    }
    
    func test_given_normal_when_execute_more_then_hasItems() async throws {
        // given
        let term: String = "검색어"
        
        // when
        let response = await sut.execute(SearchListInputImpl(
            term: term,
            isMore: true
        ))
        
        // then
        switch response {
        case .success:
            XCTFail("fetch를 요청하지 않고, more부터 부를 경우 error가 발생합니다.")
            
        case .failure(let error):
            XCTAssertTrue(
                error == .fetchRequiredBeforeMore,
                "fetch를 요청하지 않고, more부터 부를 경우 error가 발생합니다."
            )
        }
    }
    
    func test_given_error_when_execute_fetch_then_error() async throws {
        // given
        let term: String = "검색어"
        let isError: Bool = true
        self.repository.isError = isError
        
        // when
        let response = await sut.execute(SearchListInputImpl(
            term: term
        ))
        
        // then
        switch response {
        case .success:
            XCTFail("repository에서 Error가 발생한다면, usecase에서도 에러가 발생해야합니다.")
            
        case .failure:
            XCTAssertTrue(
                true,
                "repository에서 Error가 발생한다면, usecase에서도 에러가 발생해야합니다."
            )
        }
    }
    
    func test_given_items20_when_execute_fetch_then_items_20() async throws {
        // given
        let term: String = "검색어"
        let count: Int = 20
        
        self.repository.isError = false
        self.repository.count = count
        
        // when
        let response = await sut.execute(SearchListInputImpl(
            term: term
        ))
        
        // then
        switch response {
        case .success(let success):
            XCTAssertTrue(
                success.items.count == count,
                "repository에서 발생한 값과 거의 같은 값을 얻습니다."
            )
            
        case .failure(let error):
            XCTFail("repository에서 발생한 값과 거의 같은 값을 얻습니다.")
        }
    }
    
    func test_given_term_empty_when_execute_more_then_error() async throws {
        // given
        let term: String = ""
        
        // when
        let response = await self.sut.execute(SearchListInputImpl(
            term: term,
            isMore: true
        ))
        
        // then
        switch response {
        case .success:
            XCTFail("검색어가 없다면 error가 발생해야 합니다.")
            
        case .failure:
            XCTAssertTrue(
                true,
                "검색어가 없다면 error가 발생해야 합니다."
            )
        }
    }
}
