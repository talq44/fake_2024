//
//  SharedModule.swift
//  ProjectDescriptionHelpers
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription
// TQ -> TalQ

public enum SharedModule: String, CaseIterable {
    case TQCommonUI
    case TQDesignSystem
    case TQFeatureFlag
    case TQFoundation
    case TQUIKit
    
    public var name: String {
        self.rawValue
    }
}
