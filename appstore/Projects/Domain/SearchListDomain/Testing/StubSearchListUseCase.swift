//
//  StubSearchListUseCase.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

final class StubSearchListUseCase: SearchListUseCase {
    var count: Int = 30
    
    /// count를 변경하면, 해당 하는 갯수만큼 돌려줍니다. default = 30
    func execute(
        _ input: any SearchListInput
    ) async -> Result<SearchListOutput, SearchListError> {
        
    }
}
