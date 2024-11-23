//
//  StubSelectItemContainer.swift
//  SelectItemDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import AnalyticsCoreInterface
import AnalyticsCoreTesting
import SelectItemDomainInterface

import Swinject

final class StubSelectItemDomainContainer {
    
    private let container: Container
    
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
    
    func build() -> SelectItemUseCase? {
        return self.container.resolve(SelectItemUseCase.self)
    }
}
