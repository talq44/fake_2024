//
//  SubHeaderView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/26/24.
//

import UIKit

import TalqDesignSystem

import SnapKit

final class SubHeaderView: UIView {
    private enum Metric {
        static let horizontalInset: CGFloat = .horizontalMargin
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
