//
//  SearchResponseDTO+extension.swift
//  UserAPICoreTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

extension SearchResponseDTO {
    static func mockJson() -> String {
        return """
        {
          "resultCount": 2,
          "results": [
            {
              "artworkUrl60": "https://example.com/artwork60.jpg",
              "artworkUrl512": "https://example.com/artwork512.jpg",
              "artworkUrl100": "https://example.com/artwork100.jpg",
              "trackName": "Example Finance App",
              "trackId": 123456789,
              "sellerName": "Example Seller",
              "averageUserRating": 4.5,
              "userRatingCount": 1500,
              "screenshotUrls": [
                "https://example.com/screenshot1.jpg",
                "https://example.com/screenshot2.jpg"
              ],
              "genres": [
                "금융",
                "라이프스타일"
              ]
            },
            {
              "artworkUrl60": "https://example.com/artwork60_2.jpg",
              "artworkUrl512": "https://example.com/artwork512_2.jpg",
              "artworkUrl100": "https://example.com/artwork100_2.jpg",
              "trackName": "Lifestyle Tracker",
              "trackId": 987654321,
              "sellerName": "Lifestyle Inc.",
              "averageUserRating": 4.7,
              "userRatingCount": 2500,
              "screenshotUrls": [
                "https://example.com/screenshot3.jpg",
                "https://example.com/screenshot4.jpg"
              ],
              "genres": [
                "라이프스타일",
                "생산성"
              ]
            }
          ]
        }
        """
    }
}
