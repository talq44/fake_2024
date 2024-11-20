//
//  TargetDependency+Shared+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension TargetDependency {
    
    enum Shared {
        
        public static let commonUI: TargetDependency = .project(
            target: SharedModule.TQCommonUI.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TQCommonUI.name)")
        )
        
        public static let designSystem: TargetDependency = .project(
            target: SharedModule.TQDesignSystem.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TQDesignSystem.name)")
        )
        
        public static let featureFlag: TargetDependency = .project(
            target: SharedModule.TQFeatureFlag.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TQFeatureFlag.name)")
        )
        
        public static let foundation: TargetDependency = .project(
            target: SharedModule.TQFoundation.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TQFoundation.name)")
        )
        
        public static let uiKit: TargetDependency = .project(
            target: SharedModule.TQUIKit.name,
            path: .relativeToRoot("Projects/Shared/\(SharedModule.TQUIKit.name)")
        )
    }
}
