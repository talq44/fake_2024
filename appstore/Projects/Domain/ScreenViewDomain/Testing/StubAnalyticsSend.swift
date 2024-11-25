//
//  StubAnalyticsSend.swift
//  ScreenViewDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import AnalyticsCoreInterface

final class StubAnalyticsSend: AnalyticsSend {
    var sendEvent: AnalyticsCoreInterface.AnalyticsEvent?
    func send(_ event: AnalyticsCoreInterface.AnalyticsEvent) {
        self.sendEvent = event
    }
    
    var isSend: Bool {
        return sendEvent?.name == "screen_view"
    }
}
