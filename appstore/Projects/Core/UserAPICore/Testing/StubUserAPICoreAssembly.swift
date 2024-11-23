//
//  StubUserAPICoreAssembly.swift
//  UserAPICoreTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

import Swinject

final public class StubUserAPICoreAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
        container.register(
            UserAPI.self
        ) { _ in StubUserAPICore() }
    }
}
