//
//  AnalyticsSend.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

public protocol AnlayticsSend {
    func send(_ event: AnalyticsEvent)
}
