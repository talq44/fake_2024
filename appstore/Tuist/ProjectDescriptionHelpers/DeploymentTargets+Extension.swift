//
//  DeploymentTargets+Extension.swift
//  Config
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

extension DeploymentTargets {
    public static func oneVersion() -> DeploymentTargets {
        .iOS("16.0")
    }
}
