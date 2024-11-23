//
//  SearchListRepositoryImpl.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

final class SearchListRepositoryImpl: SearchListRepository {
    private let dataSource: UserAPI
    
    init(dataSource: UserAPI) {
        self.dataSource = dataSource
    }
    
    func request(_ request: SearchListRequest) async -> SearchListEntity? {
        do {
            let request = SearchRequestDTO(
                term: request.query,
                limit: request.limit,
                offset: request.offset
            )
            let response = try await dataSource.get_search(request: request)
            return self.toEntity(response: response)
        } catch {
            guard let apiError = error as? UserAPICoreError else {
                return nil
            }
            
            return SearchListEntity(statusCode: apiError.statusCode)
        }
    }
    
    private func toEntity(response: SearchResponseDTO) -> SearchListEntity {
        SearchListEntity(
            totalCount: response.resultCount,
            items: response.results.map({ item in
                SearchListEntity.Item(
                    id: "\(item.trackId)",
                    name: item.trackName,
                    averageUserRating: item.averageUserRating,
                    userRatingCount: item.userRatingCount,
                    sellerName: item.sellerName ?? "",
                    categoryName: item.genres.first ?? "",
                    thumbnailURL: item.artworkUrl100,
                    screenshotUrls: item.screenshotUrls
                )
            })
        )
    }
}
