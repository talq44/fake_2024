//
//  InfoPlist+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension InfoPlist {
    
    static let demoInfoPlist: InfoPlist? = .extendingDefault(with: [
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
    ])
}
