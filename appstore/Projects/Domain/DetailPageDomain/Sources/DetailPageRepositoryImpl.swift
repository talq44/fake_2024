//
//  DetailPageRepositoryImpl.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface
import DetailPageDomainInterface

final class DetailPageRepositoryImpl: DetailPageRepository {
    private let dataSource: UserAPI
    
    init(dataSource: UserAPI) {
        self.dataSource = dataSource
    }
    
    func request(_ id: Int) async -> DetailPageEntity? {
        do {
            let request = LookupRequestDTO(id: id)
            let response = try await self.dataSource.get_lookup(request: request)
            
            return DetailPageEntity(items: [])
            
        } catch {
            guard let userAPIError = error as? UserAPICoreError else {
                return nil
            }
            
            return DetailPageEntity(statusCode: userAPIError.statusCode)
        }
    }
}
