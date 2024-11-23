//
//  StubSearchListContainer.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import Swinject
import UserAPICoreTesting
import SearchListDomainInterface

final class StubSearchListContainer {
    private let container = Swinject.Container()
    
    init(assembly: Assembly) {
        _ = Assembler(
            [
                StubUserAPICoreAssembly(),
                assembly
            ],
            container: container
        )
    }
    
    func build() -> SearchListUseCase? {
        return container.resolve(SearchListUseCase.self)
    }
}
