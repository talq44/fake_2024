//
//  AnalyticsEvent+Extension.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

public extension AnalyticsEvent {
    var name: String {
        return String(describing: self)
            .components(separatedBy: "(").first ?? ""
    }
}
