//
//  StubAnalyticsSend.swift
//  SelectItemDomain
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import AnalyticsCoreInterface

final class StubAnalyticsSend: AnalyticsSend {
    private var sendEvent: AnalyticsCoreInterface.AnalyticsEvent? = nil
    func send(_ event: AnalyticsCoreInterface.AnalyticsEvent) {
        self.sendEvent = event
    }
    
    func isSendEvent() -> Bool {
        self.sendEvent != nil
    }
}
