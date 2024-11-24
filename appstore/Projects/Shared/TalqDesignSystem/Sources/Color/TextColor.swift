//
//  TextColor.swift
//  TalqDesignSystem
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

public enum TextColor {
    case primary
    case secondary
    case tertiary
    
    var color: UIColor {
        switch self {
        case .primary: return UIColor.label
        case .secondary: return UIColor.secondaryLabel
        case .tertiary: return UIColor.tertiaryLabel
        }
    }
}
