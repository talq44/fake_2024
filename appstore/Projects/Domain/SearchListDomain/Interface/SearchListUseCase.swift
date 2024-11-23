//
//  SearchListUseCase.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListUseCase {
    func execute(
        _ request: SearchListRequest
    ) async -> Result<SearchListResponse, SearchListError>
}
