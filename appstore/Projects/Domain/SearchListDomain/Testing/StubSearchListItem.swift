//
//  StubSearchListItem.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

struct StubSearchListItem: SearchListItem {
    let id: Int
    let name: String
    let averageUserRating: Double
    let userRatingCount: Int
    let sellerName: String
    let categoryName: String
    let thumbnailURL: String?
    let screenshotUrls: [String]
}
