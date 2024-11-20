//
//  Target+Implementation+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Implementation

public extension Target {
    
    /// Feature module implementation create
    static func implementation(
        feature: FeatureModule,
        product: Product = .staticFramework,
        hasResources: Bool = false,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: feature.name,
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(feature.rawValue)Feature",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            resources: hasResources ? ["Resources/**"] : nil,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Shared module implementation create
    static func implementation(
        shared: SharedModule,
        product: Product = .staticFramework,
        hasResources: Bool = false,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: shared.name,
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(shared.rawValue)",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            resources: hasResources ? ["Resources/**"] : nil,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Domain module implementation create
    static func implementation(
        domain: DomainModule,
        product: Product = .staticFramework,
        hasResources: Bool = false,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: domain.name,
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(domain.name)",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            resources: hasResources ? ["Resources/**"] : nil,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Core module implementation create
    static func implementation(
        core: CoreModule,
        product: Product = .staticFramework,
        hasResources: Bool = false,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: core.name,
            destinations: spec.destinations,
            product: product,
            bundleId: "com.talq.\(core.name)",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            resources: hasResources ? ["Resources/**"] : nil,
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
}

