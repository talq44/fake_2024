//
//  StubScreenViewUseCaseContainer.swift
//  ScreenViewDomainTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface
import AnalyticsCoreTesting
import ScreenViewDomainInterface

import Swinject

final class StubScreenViewUseCaseContainer {
    
    let container: Container
    
    init(assemble: Assembly) {
        self.container = Swinject.Container()
        
        _ = Assembler(
            [
                StubAnalyticsSendAssembly(),
                assemble
            ],
            container: container
        )
    }
    
    func build() -> StubScreenViewOutput? {
        return StubScreenViewOutput(
            useCase: self.container.resolve(ScreenViewUseCase.self),
            analytics: self.container.resolve(StubAnalyticsSend.self)
        )
    }
}
