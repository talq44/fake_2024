//
//  HeaderView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

import TalqDesignSystem

import SnapKit
import Kingfisher

class HeaderView: UIView {
    typealias State = HeaderViewState

    private enum Metric {
        static let imageSize = CGSize(width: 60, height: 60)
        static let radius: CGFloat = 16
    }
    
    private let stackView = UIStackView()
    private let thumbnail = UIImageView()
    private let textStackView = UIStackView()
    private let titleLabel = UILabel()
    private let captionLabel = UILabel()
    private let downButton = UIButton(configuration: .gray())
    
}
