//
//  StubAnalyticsSend.swift
//  AnalyticsCoreTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface

final internal class StubAnalyticsSend: AnlayticsSend {
    
    /// 이벤트를 확인하기 위한 내부 값
    internal var event: AnalyticsCoreInterface.AnalyticsEvent?
    
    func send(_ event: AnalyticsCoreInterface.AnalyticsEvent) {
        self.event = event
    }
}
