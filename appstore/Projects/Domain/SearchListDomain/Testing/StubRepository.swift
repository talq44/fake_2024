//
//  StubRepository.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import SearchListDomainInterface

final class StubRepository: SearchListRepository {
    var isError: Bool = false
    var totalCount: Int = 100
    var count: Int = 30
    
    func request(
        _ request: any SearchListRequest
    ) async -> Result<any SearchListEntity, SearchListError> {
        guard !isError else {
            return .failure(.unDefined)
        }
        
        let items = Array(1...count).map { id in
            StubSearchListItem(id: id)
        }
        
        let entity = StubSearchListEntity(
            totalCount: self.totalCount,
            items: items
        )
        
        return .success(entity)
    }
}
