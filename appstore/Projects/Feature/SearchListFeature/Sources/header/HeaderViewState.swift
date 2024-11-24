//
//  HeaderViewState.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import Foundation

struct HeaderViewState {
    let imageURL: String
    let name: String
    let description: String
    let isInAppPurchase: Bool
    
    static func mock(isInAppPurchase: Bool) -> Self {
        HeaderViewState(
            imageURL: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/6a/af/42/6aaf42f8-b9de-9d3a-f36c-c19fd436af4a/AppIcon-1x_U007emarketing-0-0-0-7-0-0-85-220-0.png/60x60bb.jpg",
            name: "App Store Connect",
            description: "앱 개발자들을 위한 앱",
            isInAppPurchase: isInAppPurchase
        )
    }
}
