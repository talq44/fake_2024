//
//  ScreenViewUseCaseAssembly.swift
//  ScreenViewDomain
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface
import ScreenViewDomainInterface

import Swinject

final public class ScreenViewUseCaseAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ScreenViewUseCase.self) { r in
            ScreenViewUseCaseImpl(
                analytics: r.resolve(AnalyticsSend.self)!
            )
        }
    }
}
