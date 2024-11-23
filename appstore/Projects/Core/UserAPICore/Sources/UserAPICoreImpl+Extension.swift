//
//  UserAPICoreImpl+Extension.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation
import UserAPICoreInterface

extension UserAPICoreImpl: UserAPICoreInterface.UserAPI {
    public func get_search(
        request: SearchRequestDTO
    ) async throws -> SearchResponseDTO {
        return try await self.requestJson(
            .get_search(request: request),
            type: SearchResponseDTO.self
        )
    }
    
    public func get_lookup(
        request: LookupRequestDTO
    ) async throws -> LookupResponseDTO {
        return try await self.requestJson(
            .get_lookup(request: request),
            type: LookupResponseDTO.self
        )
    }
    
    private var list_key: String {
        return "temp_list"
    }
    
    public func get_searchs_word() async throws -> [String] {
        var list: [String] = []
        if let beforeList = UserDefaults.standard.array(
            forKey: list_key
        ) as? [String] {
            list = beforeList
        }
        return list
    }
    
    public func post_searchs_word(word: String) {
        var setList: Set<String> = .init()
        if let beforeList = UserDefaults.standard.array(
            forKey: list_key
        ) as? [String] {
            beforeList.forEach { setList.insert($0) }
        }
        setList.insert(word)
        
        let list = Array(setList)
        UserDefaults.standard.set(list, forKey: list_key)
    }
}
