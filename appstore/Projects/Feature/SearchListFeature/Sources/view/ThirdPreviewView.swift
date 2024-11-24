//
//  ThirdPreviewView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

import TalqDesignSystem

class ThirdPreviewView: UIView {
    enum Metric {
        static let horizontalInset: CGFloat = .horizontalMargin
        static let spacing: CGFloat = .itemSpacing
        static let round: CGFloat = .itemRound
    }
    
    private let stackView = UIStackView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
