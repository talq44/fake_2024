//
//  ThirdPreviewView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

import TalqDesignSystem

import SnapKit
import Kingfisher

class ThirdPreviewView: UIView {
    typealias State = ThirdPreviewState
    
    enum Metric {
        static let spacing: CGFloat = .itemSpacing
        static let round: CGFloat = .itemRound
        static let itemBorder: CGFloat = 1
    }
    
    private let stackView = UIStackView()
    private let imageView01 = UIImageView()
    private let imageView02 = UIImageView()
    private let imageView03 = UIImageView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.addConfigre()
        self.makeConstraints()
    }
    
    private func addConfigre() {
        self.stackView.spacing = Metric.spacing
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        self.stackView.alignment = .center
        self.stackView.addArrangedSubview(imageView01)
        self.stackView.addArrangedSubview(imageView02)
        self.stackView.addArrangedSubview(imageView03)
        
        [imageView01, imageView02, imageView03].forEach { img in
            img.layer.borderWidth = Metric.itemBorder
            img.layer.borderColor = UIColor.lightGray.cgColor
            img.layer.cornerRadius = Metric.round
            img.contentMode = .scaleAspectFit
        }
    }
    
    private func makeConstraints() {
        self.addSubview(stackView)
        
        self.stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    internal func bind(state: State) {
        self.imageView01.kf.setImage(
            with: URL(string: state.previewURL01 ?? "")
        )
        self.imageView02.kf.setImage(
            with: URL(string: state.previewURL02 ?? "")
        )
        self.imageView03.kf.setImage(
            with: URL(string: state.previewURL03 ?? "")
        )
    }
}

#Preview("", body: {
    let contentView = UIView()
    let view = ThirdPreviewView(
        frame: CGRect(
            origin: CGPoint(x: 0, y: 80),
            size: CGSize(width: 392, height: 696 / 3)
        )
    )
    view.bind(state: .mock)
    contentView.addSubview(view)
    return contentView
})
