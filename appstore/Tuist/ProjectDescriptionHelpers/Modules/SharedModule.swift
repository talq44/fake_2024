//
//  SharedModule.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public enum SharedModule: String, CaseIterable {
	case FoundationShared
	case ErrorShared
	case TalqDesignSystem
    
    public var name: String {
        self.rawValue
    }
}
