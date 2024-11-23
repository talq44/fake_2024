//
//  ThirdPreviewView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

class ThirdPreviewView: UIView {
    enum Metric {
        static let horizontalInset: CGFloat = 16
        static let spacing: CGFloat = 8
        static let round: CGFloat = 5
    }
    
    private let stackView = UIStackView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
