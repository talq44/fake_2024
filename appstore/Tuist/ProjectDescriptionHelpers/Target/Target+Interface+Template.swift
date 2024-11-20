//
//  Target+Interface+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Interface

public extension Target {
    
    /// Feature module interface create
    static func interface(
        feature: FeatureModule,
        product: Product = .staticFramework,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: feature.name + "Interface",
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(feature.rawValue)Interface",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .interface,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Shared module interface create
    static func interface(
        shared: SharedModule,
        product: Product = .staticFramework,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: shared.name + "Interface",
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(shared.rawValue)Interface",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .interface,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Domain module interface create
    static func interface(
        domain: DomainModule,
        product: Product = .staticFramework,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: domain.name + "Interface",
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(domain.name)Interface",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .interface,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Core module interface create
    static func interface(
        core: CoreModule,
        product: Product = .framework,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: core.name + "Interface",
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(core.name)Interface",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .interface,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
}
