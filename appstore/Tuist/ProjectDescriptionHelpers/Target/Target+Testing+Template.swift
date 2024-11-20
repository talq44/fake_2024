//
//  Target+Testing+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Testing

public extension Target {
    
    /// Feature module `tests target` create
    static func testing(
        feature: FeatureModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: feature.name + "Testing",
            destinations: spec.destinations,
            product: .staticLibrary,
            bundleId: "com.talq.\(feature.rawValue)Testing",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .testing,
            scripts: spec.scripts,
            dependencies: [.target(name: feature.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Shared module `tests target` create
    static func testing(
        shared: SharedModule,
        product: Product = .framework,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: shared.name + "Testing",
            destinations: spec.destinations,
            product: .staticLibrary,
            bundleId: "com.talq.\(shared.rawValue)Testing",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .testing,
            scripts: spec.scripts,
            dependencies: [.target(name: shared.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Domain module `tests target` create
    static func testing(
        domain: DomainModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: domain.name + "Testing",
            destinations: spec.destinations,
            product: .staticLibrary,
            bundleId: "com.talq.\(domain.name)Testing",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .testing,
            scripts: spec.scripts,
            dependencies: [.target(name: domain.name)] + dependencies,
            settings: spec.settings
        )
    }
    
    /// Core module `tests target` create
    static func testing(
        core: CoreModule,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: core.name + "Testing",
            destinations: spec.destinations,
            product: .staticLibrary,
            bundleId: "com.talq.\(core.name)Testing",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .testing,
            scripts: spec.scripts,
            dependencies: [.target(name: core.name)] + dependencies,
            settings: spec.settings
        )
    }
}
