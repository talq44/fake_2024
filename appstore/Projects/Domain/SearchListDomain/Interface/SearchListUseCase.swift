//
//  SearchListUseCase.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListUseCase {
    func execute(
        _ input: SearchListInput
    ) async -> Result<SearchListOutput, SearchListError>
}
