//
//  UserAPICore.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol UserAPI {
    func get_search(
        request: SearchRequestDTO
    ) async throws -> SearchResponseDTO
    
    func get_lookup(
        request: LookupRequestDTO
    ) async throws -> LookupResponseDTO
    
    func get_searchs_word() async throws -> [String]
    
    func post_searchs_word(word: String)
}
