//
//  UserAPICoreAssembly.swift
//  UserAPICore
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

import Swinject

final public class UserAPICoreAssembly: Assembly {
    private let baseURL: String
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func assemble(container: Swinject.Container) {
        let baseUrl = self.baseURL
        container.register(
            UserAPICoreInterface.UserAPI.self
        ) { _ in UserAPICoreImpl(baseURL: baseUrl) }
    }
}
