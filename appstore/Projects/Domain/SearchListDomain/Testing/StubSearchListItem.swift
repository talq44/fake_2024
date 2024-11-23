//
//  StubSearchListItem.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

import Fakery

struct StubSearchListItem: SearchListItem {
    let id: Int
    let name: String
    let averageUserRating: Double
    let userRatingCount: Int
    let sellerName: String
    let categoryName: String
    let thumbnailURL: String?
    let screenshotUrls: [String]
    
    init(id: Int) {
        let faker = Faker(locale: "kr")
        self.id = id
        self.name = faker.commerce.productName()
        self.averageUserRating = faker.number.randomDouble(min: 0, max: 5)
        self.userRatingCount = faker.number.randomInt()
        self.sellerName = faker.company.name()
        self.categoryName = faker.commerce.color()
        self.thumbnailURL = faker.internet.image()
        self.screenshotUrls = [
            faker.internet.image(),
            faker.internet.image(),
            faker.internet.image()
        ]
    }
}
