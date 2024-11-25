//
//  SearchListEntity.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

struct SearchListEntityImpl: SearchListEntity {
    let totalCount: Int
    var items: [any SearchListDomainInterface.SearchListItem]
    
    struct Item: SearchListDomainInterface.SearchListItem {
        let id: Int
        let name: String
        let averageUserRating: Double
        let userRatingCount: Int
        let sellerName: String
        let categoryName: String
        let thumbnailURL: String?
        let screenshotUrls: [String]
    }
}

