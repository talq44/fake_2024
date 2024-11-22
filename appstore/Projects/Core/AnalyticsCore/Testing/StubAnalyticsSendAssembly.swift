//
//  StubAnalyticsSendAssembly.swift
//  AnalyticsCoreTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface

import Swinject

final class StubAnalyticsSendAssembly: Assembly {
    func assemble(container: Container) {
        container.register(
            AnalyticsSend.self
        ) { _ in StubAnalyticsSend() }
    }
}
