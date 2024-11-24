//
//  TargetDependency+Shared+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension TargetDependency {
    
    enum Shared {
        public static let designSystem: TargetDependency = .project(
            target: SharedModule.TalqDesignSystem.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TalqDesignSystem.name)")
        )
    }
}
