//
//  Project+Template.swift
//  Manifests
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension Project {
    
    static func module(
        name: String,
        options: ProjectDescription.Project.Options = .options(),
        packages: [ProjectDescription.Package] = [],
        settings: Settings?,
        targets: [ProjectDescription.Target],
        schemes: [Scheme] = [],
        resourceSynthesizers: [ProjectDescription.ResourceSynthesizer] = []
    ) -> Project {
        return Project(
            name: name,
            options: options,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,
            resourceSynthesizers: .default + resourceSynthesizers
        )
    }
}
