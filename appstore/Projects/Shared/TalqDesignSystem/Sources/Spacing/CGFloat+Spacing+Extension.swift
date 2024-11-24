//
//  CGFloat+Spacing+Extension.swift
//  TalqDesignSystem
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

public extension CGFloat {
    static var horizontalMargin: CGFloat { Spacing.horizontalMargin.size }
    static var leftMargin: CGFloat { Spacing.leftMargin.size }
    static var rightMargin: CGFloat { Spacing.rightMargin.size }
    static var itemSpacing: CGFloat { Spacing.itemSpacing.size }
    static var itemRound: CGFloat { Spacing.itemRound.size }
    static var itemBorder: CGFloat { 2 }
    static var detailItemSpacing: CGFloat { 4 }
}
