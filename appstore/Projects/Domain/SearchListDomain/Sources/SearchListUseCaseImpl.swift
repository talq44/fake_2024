//
//  SearchListUseCaseImpl.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

final class SearchListUseCaseImpl: SearchListUseCase {
    enum Constants {
        static let pageSize: Int = 30
    }
    
    private var page: Int = 0
    private var totalCount: Int = 1
    
    private let repository: SearchListRepository
    
    init(repository: SearchListRepository) {
        self.repository = repository
    }
    
    func execute(
        _ input: any SearchListInput
    ) async -> Result<any SearchListOutput, SearchListError> {
        guard input.term.count > 0 else {
            return .failure(.restError(statusCode: 400))
        }
        
        var page = self.page
        switch input.isMore {
            // fetch
        case false:
            page = 1
            
            // more
        case true:
            guard page > 0 else {
                return .failure(.fetchRequiredBeforeMore)
            }
            page = +1
        }
        
        guard self.totalCount > self.page * Constants.pageSize else {
            return .success(SearchListOutputImpl(items: []))
        }
        
        let request = SearchListRequestImpl(
            query: input.term,
            limit: Constants.pageSize,
            offset: self.page * Constants.pageSize
        )
        
        let response = await self.repository.request(request)
        
        switch response {
        case .success(let success):
            self.totalCount = success.totalCount
            self.page = page
            
            return .success(SearchListOutputImpl(
                items: success.items
            ))
            
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
