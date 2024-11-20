//
//  Target+Demo+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Demo

public extension Target {
    
    /// Feature module `demo target` create
    static func demo(
        feature: FeatureModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .demoInfoPlist,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: feature.name + "DemoApp",
            destinations: spec.destinations,
            product: .app,
            bundleId: "com.talq.\(feature.rawValue)Demo",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .demoSources,
            resources: ["Demo/Resources/**"],
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Shared module `demo target` create
    static func demo(
        shared: SharedModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .demoInfoPlist,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: shared.name + "DemoApp",
            destinations: spec.destinations,
            product: .app,
            bundleId: "com.talq.\(shared.rawValue)Demo",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .demoSources,
            resources: ["Demo/Resources/**"],
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Domain module `demo target` create
    static func demo(
        domain: DomainModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .demoInfoPlist,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: domain.name + "DemoApp",
            destinations: spec.destinations,
            product: .app,
            bundleId: "com.talq.\(domain.name)Demo",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .demoSources,
            resources: ["Demo/Resources/**"],
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    /// Core module `demo target` create
    static func demo(
        core: CoreModule,
        spec: TargetSpec = TargetSpec(
            infoPlist: .demoInfoPlist,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: core.name + "DemoApp",
            destinations: spec.destinations,
            product: .app,
            bundleId: "com.talq.\(core.name)Demo",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .demoSources,
            resources: ["Demo/Resources/**"],
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
}
