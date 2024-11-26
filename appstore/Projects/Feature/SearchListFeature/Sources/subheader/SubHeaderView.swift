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
    private enum Metric {
        static let height: CGFloat = 20
        static let horizontalInset: CGFloat = .horizontalMargin
    }
    
    private let stackView = UIStackView()
    
    private let leftContentView = UIStackView()
    private let countLabel = HDSLabel(textStyle: .caption2)
    
    private let centerContentView = UIStackView()
    private let sellerImageView = UIImageView(
        image: UIImage(systemName: "person.crop.square")
    )
    private let sellerLabel = HDSLabel(textStyle: .caption2)
    
    private let rightContentView = UIStackView()
    private let rankLabel = HDSLabel(textStyle: .caption2)
    private let genreLabel = HDSLabel(textStyle: .caption2)
    

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
        self.stackView.distribution = .fillEqually
        [self.leftContentView,
         self.centerContentView,
         self.rightContentView].forEach { stackView in
            self.stackView.axis = .horizontal
        }
        self.leftContentView.alignment = .leading
        self.centerContentView.alignment = .center
        self.rightContentView.alignment = .trailing
        
        self.stackView.addArrangedSubview(leftContentView)
        self.stackView.addArrangedSubview(centerContentView)
        self.stackView.addArrangedSubview(rightContentView)
        
        self.countLabel.textAlignment = .left
        self.sellerLabel.textAlignment = .center
        self.rankLabel.textAlignment = .right
        self.genreLabel.textAlignment = .right
    }
    
    private func makeConstraints() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(Metric.horizontalInset)
            $0.height.equalTo(Metric.height)
        }
        
        self.leftContentView.addArrangedSubview(countLabel)
        self.leftContentView.addArrangedSubview(UIView())
        
        self.centerContentView.addArrangedSubview(sellerImageView)
        self.centerContentView.addArrangedSubview(sellerLabel)
        
        self.rightContentView.addArrangedSubview(UIView())
        self.rightContentView.addArrangedSubview(rankLabel)
        self.rightContentView.addArrangedSubview(genreLabel)
    }
    
    func bind(state: State) {
        self.countLabel.text = state.ratingCount.koreanNumberFormat
        self.sellerLabel.text = state.brandName
        self.rankLabel.text = "#" + state.ranking.toString
        self.genreLabel.text = state.genre
    }
}

#Preview {
    let view = SubHeaderView()
    view.bind(state: .mock)
    return view
}
