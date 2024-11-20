//
//  SourceFilesList+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension SourceFilesList {
    static let demoSources: SourceFilesList = "Demo/Sources/**"
    static let interface: SourceFilesList = "Interface/**"
    static let sources: SourceFilesList = "Sources/**"
    static let testing: SourceFilesList = "Testing/**"
    static let unitTests: SourceFilesList = "Tests/**"
    static let uiTests: SourceFilesList = "UITests/**"
}
