//
//  DetailPageDomainAssembly.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface
import DetailPageDomainInterface

import Swinject

final public class DetailPageDomainAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(DetailPageUseCase.self) { r in
            let userAPI = r.resolve(UserAPI.self)!
            let repository = DetailPageRepositoryImpl(dataSource: userAPI)
            return DetailPageUseCaseImpl(repository: repository)
        }
    }
}
