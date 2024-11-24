//
//  Spacing.swift
//  TalqDesignSystem
//
//  Created by 박창규 on 11/24/24.
//

import Foundation

/// Spacing Token
public enum Spacing {
    case horizontalMargin
    case leftMargin
    case rightMargin
    
    var size: CGFloat {
        switch self {
        case .horizontalMargin: return SpacingSize.Spacing_l.rawValue
        case .leftMargin: return SpacingSize.Spacing_l.rawValue
        case .rightMargin: return SpacingSize.Spacing_l.rawValue
        }
    }
}
