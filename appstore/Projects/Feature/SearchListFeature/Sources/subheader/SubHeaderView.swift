//
//  SubHeaderView.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/26/24.
//

import UIKit

import FoundationShared
import TalqDesignSystem

import SnapKit

final class SubHeaderView: UIView {
    typealias State = SubHeaderViewState
    
    private let stackView = UIStackView()
    
    private let leftContentView = UIView()
    private let countLabel = HDSLabel(textStyle: .caption2)
    
    private let centerContentView = UIView()
    private let sellerImageView = UIImageView(
        image: UIImage(systemName: "person.crop.square")
    )
    private let sellerLabel = HDSLabel(textStyle: .caption2)
    
    private let rightContentView = UIView()
    private let rankLabel = HDSLabel(textStyle: .caption2)
    private let genreLabel = HDSLabel(textStyle: .caption2)
    
    private enum Metric {
        static let horizontalInset: CGFloat = .horizontalMargin
    }

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
        self.stackView.axis = .vertical
        self.stackView.distribution = .fillEqually
        self.countLabel.textAlignment = .left
        self.sellerLabel.textAlignment = .center
        self.genreLabel.textAlignment = .right
        
        self.stackView.addArrangedSubview(leftContentView)
        self.stackView.addArrangedSubview(centerContentView)
        self.stackView.addArrangedSubview(rightContentView)
    }
    
    private func makeConstraints() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(Metric.horizontalInset)
        }
        
        self.leftContentView.addSubview(countLabel)
        
        self.centerContentView.addSubview(sellerImageView)
        self.centerContentView.addSubview(sellerLabel)
        
        self.rightContentView.addSubview(rankLabel)
        self.rightContentView.addSubview(genreLabel)
    }
    
    func bind(state: State) {
        self.countLabel.text = state.ratingCount.koreanNumberFormat
        self.sellerLabel.text = state.brandName
        self.rankLabel.text = state.ranking.toString
        self.genreLabel.text = state.genre
    }
}

#Preview {
    let view = SubHeaderView()
    view.bind(state: .mock)
    return view
}
