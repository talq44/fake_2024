//
//  StubAnalyticsAssembly.swift
//  AnalyticsCoreTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface

import Swinject

final class StubAnalyticsContainer {
    private let container: Container
    
    init(container: Container) {
        self.container = container
        
        _ = Assembler(
            [
                StubAnalyticsSendAssembly()
            ],
            container: container
        )
    }
    
    func build() -> AnalyticsSend? {
        return self.container.resolve(AnalyticsSend.self)
    }
}
