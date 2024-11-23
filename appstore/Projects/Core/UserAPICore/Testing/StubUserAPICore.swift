//
//  StubUserAPIUseCase.swift
//  UserAPICoreTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

final class StubUserAPICore: UserAPI {
    
    private var searchWords: Set<String> = []
    
    func get_search(
        request: UserAPICoreInterface.SearchRequestDTO
    ) async throws -> UserAPICoreInterface.SearchResponseDTO {
        do {
            let response = try JSONDecoder().decode(
                SearchResponseDTO.self,
                from: SearchResponseDTO.mockJson().data(using: .utf8)!
            )
            return response
        } catch {
            throw error
        }
    }
    
    func get_lookup(
        request: UserAPICoreInterface.LookupRequestDTO
    ) async throws -> UserAPICoreInterface.LookupResponseDTO {
        do {
            let response = try JSONDecoder().decode(
                LookupResponseDTO.self,
                from: LookupResponseDTO.mock().data(using: .utf8)!
            )
            return response
        } catch {
            throw error
        }
    }
    
    func get_searchs_word() async throws -> [String] {
        return Array(self.searchWords)
    }
    
    func post_searchs_word(word: String) {
        guard !self.searchWords.contains(word) else {
            return
        }
        self.searchWords.insert(word)
    }
}
