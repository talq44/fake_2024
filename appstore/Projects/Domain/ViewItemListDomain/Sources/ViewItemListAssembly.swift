//
//  ViewItemListAssembly.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import AnalyticsCoreInterface
import ViewItemListDomainInterface

import Swinject

final public class ViewItemListAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
        container.register(ViewItemListUseCase.self) { r in
            let analytics = r.resolve(AnalyticsSend.self)!
            return ViewItemListUseCaseImpl(analytics: analytics)
        }
    }
}
