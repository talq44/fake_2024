//
//  Target+Preview+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Preview

public extension Target {
    
    static func preview(
        feature: FeatureModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        .target(
            name: feature.name + "Preview",
            destinations: spec.destinations,
            product: .framework, // framework 타입 고정 건드리지 말 것
            bundleId: "com.talq.\(feature.rawValue)Preview",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    static func preview(
        domain: DomainModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        .target(
            name: domain.name + "Preview",
            destinations: spec.destinations,
            product: .framework, // framework 타입 고정 건드리지 말 것
            bundleId: "com.talq.\(domain.rawValue)Preview",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    static func preview(
        core: CoreModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        .target(
            name: core.name + "Preview",
            destinations: spec.destinations,
            product: .framework, // framework 타입 고정 건드리지 말 것
            bundleId: "com.talq.\(core.rawValue)Preview",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    static func preview(
        shared: SharedModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        .target(
            name: shared.name + "Preview",
            destinations: spec.destinations,
            product: .framework, // framework 타입 고정 건드리지 말 것
            bundleId: "com.talq.\(shared.rawValue)Preview",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
}

