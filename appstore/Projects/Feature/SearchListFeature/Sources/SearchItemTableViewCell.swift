//
//  SearchItemTableViewCell.swift
//  SearchListFeature
//
//  Created by 박창규 on 11/27/24.
//

import UIKit

import TalqDesignSystem

import SnapKit

final class SearchItemTableViewCell: UITableViewCell {
    
    struct State {
        let header: HeaderViewState
        let subHeader: SubHeaderViewState
        let preview: ThirdPreviewState
    }
    
    private enum Metric {
        static let horizontalInset: CGFloat = .horizontalMargin
        static let itemSpacing: CGFloat = .itemSpacing
    }
    
    private let stackView = UIStackView()
    
    private let headerView = HeaderView()
    private let subHeaderView = SubHeaderView()
    private let previewView = ThirdPreviewView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        self.stackView.spacing = Metric.itemSpacing
    }
    
    private func makeConstraints() {
        self.contentView.addSubview(stackView)
        self.stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(Metric.horizontalInset)
        }
        self.stackView.addArrangedSubview(headerView)
        self.stackView.addArrangedSubview(subHeaderView)
        self.stackView.addArrangedSubview(previewView)
    }
    
    func bind(state: State) {
        self.headerView.bind(state: state.header)
        self.subHeaderView.bind(state: state.subHeader)
        self.previewView.bind(state: state.preview)
    }
}

#Preview {
    let cell = SearchItemTableViewCell(
        style: .default,
        reuseIdentifier: ""
    )
    
    cell.bind(state: SearchItemTableViewCell.State(
        header: .mock(isInAppPurchase: false),
        subHeader: .mock,
        preview: .mock
    ))
              
    return cell
}
