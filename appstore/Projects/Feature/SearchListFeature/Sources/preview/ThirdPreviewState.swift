//
//  ThirdPreviewState.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import Foundation

struct ThirdPreviewState {
    let previewURL01: String?
    let previewURL02: String?
    let previewURL03: String?
    
    static var mock: Self {
        ThirdPreviewState(
            previewURL01: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/00/83/ff/0083ffb8-c077-ad8e-8261-25ec39e2abee/94fb2fec-168c-43dc-9fd0-e290a642d167_iPhone_8_Plus_-_01_Apps.png/392x696bb.png",
            previewURL02: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/74/fb/57/74fb57e0-dbb0-0132-5cde-2c567248d2a8/803b4d5d-682f-4236-935d-104d1122b2b9_iPhone_8_Plus_-_02_App_Details.png/392x696bb.png",
            previewURL03: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/1c/50/ca/1c50cabc-255a-5b21-d9a2-35d2ccb8af7c/5b2346d7-91d9-4951-a1ac-08d6055f1b5a_iPhone_5.5in_-_03_TestFlight_Groups.png/392x696bb.png"
        )
    }
}
