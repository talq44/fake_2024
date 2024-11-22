//
//  StubViewItemListContainer.swift
//  ViewItemListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import AnalyticsCoreInterface
import AnalyticsCoreTesting
import ScreenViewDomainInterface

import Swinject

final class StubViewItemListContainer {
    
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
    
    func build() -> StubViewItmeListUseCase? {
        return self.container.resolve(StubViewItmeListUseCase.self)
    }
}
