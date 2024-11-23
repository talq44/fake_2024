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
                    "artworkUrl60": "https://example.com/artwork60_1.png",
                    "artworkUrl512": "https://example.com/artwork512_1.png",
                    "artworkUrl100": "https://example.com/artwork100_1.png",
                    "trackName": "Mock App 1",
                    "trackId": 123456,
                    "averageUserRating": 4.5,
                    "userRatingCount": 1024,
                    "screenshotUrls": [
                        "https://example.com/screenshot1_1.png",
                        "https://example.com/screenshot1_2.png"
                    ]
                },
                {
                    "artworkUrl60": "https://example.com/artwork60_2.png",
                    "artworkUrl512": "https://example.com/artwork512_2.png",
                    "artworkUrl100": "https://example.com/artwork100_2.png",
                    "trackName": "Mock App 2",
                    "trackId": 789101,
                    "averageUserRating": 4.7,
                    "userRatingCount": 2048,
                    "screenshotUrls": [
                        "https://example.com/screenshot2_1.png",
                        "https://example.com/screenshot2_2.png",
                        "https://example.com/screenshot2_3.png"
                    ]
                }
            ]
        }
        
        """
    }
}
