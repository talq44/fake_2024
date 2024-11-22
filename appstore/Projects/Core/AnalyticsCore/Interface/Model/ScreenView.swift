//
//  ScreenView.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

/// Screen View event. This event signifies a screen view. Use this when a screen transition occurs. This event can be logged irrespective of whether automatic screen tracking is enabled.
/// firebase: https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#SCREEN_VIEW()
public struct ScreenView: Codable, Equatable {
    public let screen_class: String
    public let screen_name: String
    
    public init(screen_class: String, screen_name: String) {
        self.screen_class = screen_class
        self.screen_name = screen_name
    }
}
