//
//  SearchListEntity.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

struct SearchListEntity {
    let totalCount: Int
    let items: [Item]
    let statusCode: Int?
    
    struct Item: SearchListItem {
        let id: String
        let name: String
        let averageUserRating: Double
        let userRatingCount: Int
        let sellerName: String
        let categoryName: String
        let thumbnailURL: String?
        let screenshotUrls: [String]
    }
    
    init(totalCount: Int, items: [Item]) {
        self.totalCount = totalCount
        self.items = items
        self.statusCode = nil
    }
    
    init (statusCode: Int) {
        self.totalCount = 0
        self.items = []
        self.statusCode = statusCode
    }
}
