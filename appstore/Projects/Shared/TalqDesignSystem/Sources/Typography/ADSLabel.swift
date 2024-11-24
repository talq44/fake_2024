//
//  ADSLabel.swift
//  TalqDesignSystem
//
//  Created by 박창규 on 11/24/24.
//

import UIKit

/// HIG Design System Label
public class HDSLabel: UIView {
    
    private let label = UILabel()
    
    public var text: String? {
        didSet {
            self.label.text = text
        }
    }
    
    public var textStyle: UIFont.TextStyle {
        didSet {
            self.label.font = UIFont.preferredFont(forTextStyle: textStyle)
        }
    }
    
    public var fontStyle: UIFont.TextStyle? = nil {
        didSet {
            guard let fontStyle else { return }
            self.label.font = UIFont.preferredFont(forTextStyle: fontStyle)
        }
    }
    
    public var textColor: TextColor {
        didSet {
            self.label.textColor = textColor.color
        }
    }
    
    public var numberOfLines: Int = 1 {
        didSet {
            self.label.numberOfLines = numberOfLines
        }
    }
    
    public var textAlignment: NSTextAlignment = .left {
        didSet {
            self.label.textAlignment = textAlignment
        }
    }
    
    public init(
        textStyle: UIFont.TextStyle,
        textColor: TextColor? = nil,
        frame: CGRect = .zero
    ) {
        self.textStyle = textStyle
        self.textColor = textColor ?? textStyle.textColor
        super.init(frame: frame)
        
        self.label.font = UIFont.preferredFont(forTextStyle: textStyle)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.makeConstratins()
    }
    
    private func makeConstratins() {
        self.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension UIFont.TextStyle {
    var color: UIColor {
        switch self {
        case .largeTitle:
            return .label
            /// 주요 섹션 제목
        case .title1:
            return .label
            /// 주요 섹션 제목
        case .title2:
            return .label
            /// 카드, 리스트 제목
        case .title3:
            return .label
            /// 강조된 텍스트
        case .headline:
            return .label
            ///     기본 본문 텍스트
        case .body:
            return .label
            /// 강조된 부가 설명 텍스트
        case .callout:
            return .secondaryLabel
            /// 부가 정보
        case .subheadline:
            return .secondaryLabel
            /// 작은 부가 정보
        case .footnote:
            return .secondaryLabel
            /// 세부 설명
        case .caption1:
            return .secondaryLabel
            /// 덜 강조된 부가 설명
        case .caption2:
            return .tertiaryLabel
            
        default: return UIColor.label
        }
    }
    
    var textColor: TextColor {
        let textColor = TextColor.allCases
            .filter { $0.color == self.color }
            .first
        
        guard let textColor else {
            return .primary
        }
        
        return textColor
    }
}
