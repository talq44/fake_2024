//
//  TargetDependency+TMA+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension TargetDependency {
 
    static func feature(target: FeatureModule, type: ModuleType) -> TargetDependency {
        return .project(
            target: target.name + type.name,
            path: .relativeToRoot("Projects/Feature/\(target.name)")
        )
    }
    
    static func domain(target: DomainModule, type: ModuleType) -> TargetDependency {
        return .project(
            target: target.name + type.name,
            path: .relativeToRoot("Projects/Domain/\(target.name)")
        )
    }
    
    static func core(target: CoreModule, type: ModuleType = .implementation) -> TargetDependency {
        return .project(
            target: target.name + type.name,
            path: .relativeToRoot("Projects/Core/\(target.name)")
        )
    }
    
    static func shared(target: SharedModule, type: ModuleType = .implementation) -> TargetDependency {
        return .project(
            target: target.name + type.name,
            path: .relativeToRoot("Projects/Shared/\(target.name)")
        )
    }
}
