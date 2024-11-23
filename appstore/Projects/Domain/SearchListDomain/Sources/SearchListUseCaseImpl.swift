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
        
        let request = SearchListRequest(
            query: input.term,
            limit: Constants.pageSize,
            offset: self.page * Constants.pageSize
        )
        
        let entity = await self.repository.request(request)
        
        guard let entity = entity else {
            return .failure(.unDefined)
        }
        
        guard entity.statusCode == nil else {
            guard let statusCode = entity.statusCode else {
                return .failure(.unDefined)
            }
            
            return .failure(.restError(statusCode: statusCode))
        }
        
        self.totalCount = entity.totalCount
        self.page = page
        return .success(SearchListOutputImpl(items: entity.items))
    }
}
