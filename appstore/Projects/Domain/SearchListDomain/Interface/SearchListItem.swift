//
//  SearchListItem.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListItem {
    var id: String { get }
    var name: String { get }
    var averageUserRating: Double { get }
    var userRatingCount: Int { get }
    var sellerName: String { get }
    var categoryName: String { get }
    var thumbnailURL: String? { get }
    var screenshotUrls: [String] { get }
}
