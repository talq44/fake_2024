//
//  BackgroundColor.swift
//  TalqDesignSystem
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

public enum BackgroundColor {
    case primary
    case secondary
    
    var color: UIColor {
        switch self {
        case .primary: return UIColor.systemBackground
        case .secondary: return UIColor.secondarySystemBackground
        }
    }
}
