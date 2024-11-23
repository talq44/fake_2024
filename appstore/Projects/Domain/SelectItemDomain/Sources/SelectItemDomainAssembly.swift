//
//  SelectItemDomainAssembly.swift
//  SelectItemDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SelectItemDomainInterface
import AnalyticsCoreInterface

import Swinject

final public class SelectItemDomainAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(SelectItemUseCase.self) { r in
            let analytic = r.resolve(AnalyticsCoreInterface.AnalyticsSend.self)!
            return SelectItemUseCaseImpl(analytics: analytic)
        }
    }
}
