//
//  Target+Application+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

// MARK: - Application

public extension Target {
    
    /// Feature module implementation create
    static func application(
        name: String,
        spec: TargetSpec = TargetSpec(
            infoPlist: .default,
            settings: .Framework.default
        ),
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: name,
            destinations: spec.destinations,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .sources,
            resources: ["Resources/**"],
            scripts: spec.scripts,
            dependencies: dependencies,
            settings: spec.settings
        )
    }
    
    static func applicationTests(
        name: String,
        spec: TargetSpec = TargetSpec(infoPlist: .default),
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: name + "Tests",
            destinations: spec.destinations,
            product: .unitTests,
            bundleId: "com.talq.\(name)Tests",
            deploymentTargets: .appVersion,
            infoPlist: spec.infoPlist,
            sources: .unitTests,
            resources: nil,
            scripts: spec.scripts,
            dependencies: [.target(name: name)] + dependencies,
            settings: spec.settings
        )
    }
}

