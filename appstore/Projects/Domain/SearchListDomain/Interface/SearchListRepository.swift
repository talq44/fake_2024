//
//  SearchListRepository.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

protocol SearchListRepository {
    func request(
        _ request: SearchListRequest
    ) async -> Result<SearchListEntity, SearchListError>
}
