//
//  TargetDependency+ThirdParty+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension TargetDependency {
    
    enum ThirdParty {
        
        public static let reactiveX: TargetDependency = .project(
            target: "ReactiveX",
            path: .relativeToRoot("Projects/ThirdParty/ReactiveX")
        )
    }
}
