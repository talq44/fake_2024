//
//  TargetSpec.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public struct TargetSpec {
    public var destinations: ProjectDescription.Destinations
    public var infoPlist: ProjectDescription.InfoPlist?
    public var entitlements: ProjectDescription.Entitlements?
    public var scripts: [ProjectDescription.TargetScript]
    public var settings: ProjectDescription.Settings?
    public var launchArguments: [ProjectDescription.LaunchArgument]
    
    public init(
        destinations: ProjectDescription.Destinations = .iOS,
        productName: String? = nil,
        deploymentTargets: ProjectDescription.DeploymentTargets? = nil,
        infoPlist: ProjectDescription.InfoPlist? = nil,
        entitlements: ProjectDescription.Entitlements? = nil,
        scripts: [ProjectDescription.TargetScript] = [],
        settings: ProjectDescription.Settings? = nil,
        launchArguments: [ProjectDescription.LaunchArgument] = []
    ) {
        self.destinations = destinations
        self.infoPlist = infoPlist
        self.entitlements = entitlements
        self.scripts = scripts
        self.settings = settings
        self.launchArguments = launchArguments
    }
}
