//
//  SearchResultDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

public struct SearchResultDTO: Decodable {
    public let artworkUrl60: String?
    public let artworkUrl512: String?
    public let artworkUrl100: String?
    
    public let trackName: String
    public let trackId: Int
    public let sellerName: String?
    
    public let averageUserRating: Double
    
    public let userRatingCount: Int
    
    public let screenshotUrls: [String]
    /// ["금융", "라이프스타일"]
    public let genres: [String]
}
