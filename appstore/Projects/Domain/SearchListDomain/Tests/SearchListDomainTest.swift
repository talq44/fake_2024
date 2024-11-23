import XCTest

@testable import SearchListDomain
@testable import SearchListDomainTesting

final class SearchListDomainTests: XCTestCase {
    
    private var container: StubSearchListContainer!
    
    override func setUpWithError() throws {
        self.container = StubSearchListContainer(
            assembly: SearchListDomainAssembly()
        )
    }

    override func tearDownWithError() throws {
        self.container = nil
    }

    func test_given_normal_when_execute_fetch_then_hasItems() async throws {
        // given
        let term: String = "검색어"
        guard let useCase = self.container.build() as? SearchListUseCaseImpl else {
            XCTFail("usecase 생성에 실패했습니다.")
            return
        }
        
        // when
        let response = await useCase.execute(SearchListInputImpl(
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
        guard let useCase = self.container.build() as? SearchListUseCaseImpl else {
            XCTFail("usecase 생성에 실패했습니다.")
            return
        }
        
        // when
        let response = await useCase.execute(SearchListInputImpl(
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
    
    func test_given_term_empty_when_execute_more_then_error() async throws {
        // given
        let term: String = ""
        guard let useCase = self.container.build() as? SearchListUseCaseImpl else {
            XCTFail("usecase 생성에 실패했습니다.")
            return
        }
        
        // when
        let response = await useCase.execute(SearchListInputImpl(
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
