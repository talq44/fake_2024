//
//  SubHeaderViewState.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/26/24.
//

import Foundation

struct SubHeaderViewState {
    let averageRating: Double
    let ratingCount: Int
    let brandName: String
    let ranking: Int
    let genre: String
    
    static var mock: SubHeaderViewState {
        SubHeaderViewState(
            averageRating: 4.5,
            ratingCount: 12345678,
            brandName: "Awesome Brand",
            ranking: 1,
            genre: "Action"
        )
    }
}
