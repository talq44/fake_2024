import XCTest

@testable import UserAPICoreInterface
@testable import UserAPICoreTesting

final class StubUserAPICoreTests: XCTestCase {
    
    private var userAPI: StubUserAPICore!
    
    override func setUpWithError() throws {
        self.userAPI = StubUserAPICore()
    }

    override func tearDownWithError() throws {
        self.userAPI = nil
    }
    
    func test_given_정상ID_when_get_lookup_then_목록있음() async throws {
        // given
        let id: Int = 640199958
        
        // when
        let response = try await self.userAPI.get_lookup(
            request: LookupRequestDTO(id: id)
        )
        
        // then
        XCTAssertTrue(response.results.count > 0)
    }
    
    func test_given_카카오_when_get_search_then_목록있음() async throws {
        // given
        let term: String = "카카오"
        let request = SearchRequestDTO(
            term: term,
            limit: 10,
            offset: 0
        )
        
        // when
        let response = try await self.userAPI.get_search(
            request: request
        )
        
        // then
        XCTAssertTrue(response.results.count > 0)
    }
    
    func test_given_검색어_선택_when_post_get_then_검색한검색어가존재() async throws {
        // given
        let term: String = "검색어 선택"
        
        // when
        self.userAPI.post_searchs_word(word: term)
        let response = try await self.userAPI.get_searchs_word()
        
        // then
        XCTAssertTrue(
            response.contains(term),
            "검색을 실행했던 값은 리스트에 포함되어야 합니다."
        )
    }
}
