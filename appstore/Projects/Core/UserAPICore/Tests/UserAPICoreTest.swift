import XCTest

@testable import UserAPICoreInterface
@testable import UserAPICore

final class UserAPICoreTests: XCTestCase {
    
    private var userAPI: UserAPICoreImpl!
    
    override func setUpWithError() throws {
        self.userAPI = UserAPICoreImpl(baseURL: "https://itunes.apple.com")
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
    
    func test_given_비정상ID_when_get_lookup_then_실패가성공() async throws {
        // given
        let id: Int = -1
        
        // when
        do {
            let _ = try await self.userAPI.get_lookup(
                request: LookupRequestDTO(id: id)
            )
            
            XCTFail("성공하면 안됩니다.")
        } catch {
            // then
            XCTAssertTrue(error is UserAPICoreError)
        }
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
    
    func test_given_검색어없음_when_get_search_then_목록없음() async throws {
        // given
        let term: String = ""
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
        XCTAssertTrue(response.results.count == 0)
    }
}
