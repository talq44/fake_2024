//
//  SearchListDomainAssembly.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface
import UserAPICoreInterface

import Swinject

final public class SearchListDomainAssembly: Assembly {
    public init() {}
    public func assemble(container: Swinject.Container) {
        container.register(SearchListUseCase.self) { r in
            let userAPI = r.resolve(UserAPI.self)!
            let repository = SearchListRepositoryImpl(dataSource: userAPI)
            return SearchListUseCaseImpl(repository: repository)
        }
    }
}
