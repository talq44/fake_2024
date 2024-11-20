//
//  Target+Tests+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Tests

public extension Target {
    
    /// Feature module `tests target` create
    static func tests(
        feature: FeatureModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: feature.name + "Tests",
            destinations: spec.destinations,
            product: .unitTests,
            bundleId: "com.talq.\(feature.rawValue)Tests",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .unitTests,
            scripts: spec.scripts,
            dependencies: [.target(name: feature.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Shared module `tests target` create
    static func tests(
        shared: SharedModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: shared.name + "Tests",
            destinations: spec.destinations,
            product: .unitTests,
            bundleId: "com.talq.\(shared.rawValue)Tests",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .unitTests,
            scripts: spec.scripts,
            dependencies: [.target(name: shared.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Domain module `tests target` create
    static func tests(
        domain: DomainModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: domain.name + "Tests",
            destinations: spec.destinations,
            product: .unitTests,
            bundleId: "com.talq.\(domain.name)Tests",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .unitTests,
            scripts: spec.scripts,
            dependencies: [.target(name: domain.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Core module `tests target` create
    static func tests(
        core: CoreModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: core.name + "Tests",
            destinations: spec.destinations,
            product: .unitTests,
            bundleId: "com.talq.\(core.name)Tests",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .unitTests,
            scripts: spec.scripts,
            dependencies: [.target(name: core.name)] + dependencies,
            settings: spec.settings
        )
    }
}
