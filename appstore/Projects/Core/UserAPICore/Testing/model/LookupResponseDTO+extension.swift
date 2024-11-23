//
//  LookupResponseDTO+extension.swift
//  UserAPICoreTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

extension LookupResponseDTO {
    static func mock() -> String {
        let jsonString = """
        {
            "resultCount": 1,
            "results": [
                {
                    "screenshotUrls": [
                        "https://example.com/screenshot1.png",
                        "https://example.com/screenshot2.png"
                    ],
                    "artworkUrl60": "https://example.com/artwork60.png",
                    "artworkUrl512": "https://example.com/artwork512.png",
                    "artworkUrl100": "https://example.com/artwork100.png",
                    "artistViewUrl": "https://example.com/developerProfile",
                    "supportedDevices": ["iPhone", "iPad", "iPod"],
                    "advisories": ["Gambling", "Infrequent/Mild Alcohol"],
                    "kind": "software",
                    "userRatingCountForCurrentVersion": 1250,
                    "minimumOsVersion": "13.0",
                    "averageUserRatingForCurrentVersion": 4.6,
                    "sellerUrl": "https://example.com/seller",
                    "averageUserRating": 4.5,
                    "trackCensoredName": "Mock App",
                    "languageCodesISO2A": ["EN", "KR", "FR"],
                    "fileSizeBytes": "104857600",
                    "formattedPrice": "Free",
                    "contentAdvisoryRating": "4+",
                    "trackViewUrl": "https://example.com/appStore",
                    "trackContentRating": "4+",
                    "bundleId": "com.example.mockapp",
                    "artistId": 987654321,
                    "artistName": "Mock Developer",
                    "genres": ["Utilities", "Productivity"],
                    "price": 0.0,
                    "sellerName": "Mock Seller",
                    "releaseDate": "2022-01-01T00:00:00Z",
                    "genreIds": ["6002", "6007"],
                    "trackId": 1234567890,
                    "trackName": "Mock App",
                    "isVppDeviceBasedLicensingEnabled": true,
                    "primaryGenreName": "Utilities",
                    "primaryGenreId": 6002,
                    "currentVersionReleaseDate": "2023-01-01T00:00:00Z",
                    "releaseNotes": "Bug fixes and performance improvements.",
                    "version": "2.0.1",
                    "wrapperType": "software",
                    "currency": "USD",
                    "description": "This is a mock app used for testing purposes. It demonstrates a variety of app features and settings.",
                    "userRatingCount": 5000
                }
            ]
        }
        """
        
        return jsonString
    }
}
