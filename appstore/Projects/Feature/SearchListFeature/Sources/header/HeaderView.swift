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
        static let horizontalInset: CGFloat = .horizontalMargin
        static let imageSize = CGSize(width: 60, height: 60)
        static let radius: CGFloat = 16
        static let itemSpacing: CGFloat = .itemSpacing
        static let detailItemSpacing: CGFloat = .detailItemSpacing
    }
    
    private let stackView = UIStackView()
    // 왼쪽 영역
    private let thumbnail = UIImageView()
    // 가운데 영역
    private let centerStackView = UIStackView()
    private let titleLabel = HDSLabel(textStyle: .headline)
    private let captionLabel = HDSLabel(textStyle: .caption1)
    // 오른쪽 영역
    private let trailingStackView = UIStackView()
    private let downButton = UIButton(configuration: .gray())
    private let inAppPurchaseLabel = HDSLabel(textStyle: .caption2)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.addConfigure()
        self.makeConstraints()
    }
    
    private func addConfigure() {
        self.stackView.axis = .horizontal
        self.stackView.spacing = Metric.itemSpacing
        self.stackView.alignment = .center
        self.stackView.distribution = .fill
        
        self.centerStackView.axis = .vertical
        self.trailingStackView.axis = .vertical
        self.centerStackView.spacing = Metric.detailItemSpacing
        self.trailingStackView.spacing = Metric.detailItemSpacing
        self.trailingStackView.alignment = .center
        
        self.stackView.addArrangedSubview(self.thumbnail)
        self.stackView.addArrangedSubview(self.centerStackView)
        centerStackView.addArrangedSubview(titleLabel)
        centerStackView.addArrangedSubview(captionLabel)
        self.stackView.addArrangedSubview(UIView())
        self.stackView.addArrangedSubview(self.trailingStackView)
        trailingStackView.addArrangedSubview(downButton)
        trailingStackView.addArrangedSubview(inAppPurchaseLabel)
        
        self.addConfigureImages()
        self.inAppPurchaseLabel.text = "앱 내 구입"
        self.downButton.setTitle("받기", for: .normal)
    }
    
    private func addConfigureImages() {
        self.thumbnail.clipsToBounds = true
        self.thumbnail.layer.cornerRadius = Metric.radius
    }
    
    private func makeConstraints() {
        self.addSubview(stackView)
        self.stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(Metric.horizontalInset)
        }
        
        self.thumbnail.snp.makeConstraints {
            $0.size.equalTo(Metric.imageSize)
        }
    }
    
    func bind(state: State) {
        self.thumbnail.kf.setImage(with: URL(string: state.imageURL))
        self.titleLabel.text = state.name
        self.captionLabel.text = state.description
        self.inAppPurchaseLabel.isHidden = !state.isInAppPurchase
    }
}

#Preview() {
    let view = HeaderView()
    view.bind(state: .mock(isInAppPurchase: true))
    return view
}
