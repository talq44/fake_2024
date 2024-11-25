//
//  StubAnalyticsCore.swift
//  ViewItemListDomain
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import AnalyticsCoreInterface

final class StubAnalyticsCore: AnalyticsSend {
    var sendEvent: AnalyticsCoreInterface.AnalyticsEvent? = nil
    func send(_ event: AnalyticsCoreInterface.AnalyticsEvent) {
        self.sendEvent = event
    }
}
