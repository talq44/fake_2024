//
//  DetailPageUseCaseImpl.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import DetailPageDomainInterface

final class DetailPageUseCaseImpl: DetailPageUseCase {
    private let repository: DetailPageRepository
    
    init(repository: DetailPageRepository) {
        self.repository = repository
    }
    
    func execute(
        _ input: any DetailPageDomainInterface.DetailPageInput
    ) async -> Result<any DetailPageOutput, DetailPageError> {
        let entity = await repository.request(input.id)
        
        guard let entity else {
            return .failure(.undefined)
        }
        
        guard entity.statusCode != nil else {
            guard let statusCode = entity.statusCode else {
                return .failure(.undefined)
            }
            
            return .failure(.rest(statusCode: statusCode))
        }
        
        guard let item = entity.items.first else {
            return .failure(.rest(statusCode: 404))
        }
        
        return .success(item)
    }
}
