//
//  Int+Extension.swift
//  FoundationShared
//
//  Created by 박창규 on 11/26/24.
//

import Foundation

public extension Int {
    var toString: String {
        return "\(self)"
    }
    
    var priceForamt: String {
        self.decimalFormat + "원"
    }
    
    var decimalFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: self) else {
            return "0"
        }
        
        return result
    }
    
    var koreanNumberFormat: String {
        let number = Double(self) // 소수점 계산을 위해 Double로 변환
        
        switch number {
        case 0..<1_000:
            // 천 단위 미만은 그대로 표시
            return "\(self)"
        case 1_000..<10_000:
            // 천 단위 (1.0천 ~ 9.9천)
            return String(format: "%.1f천", number / 1_000)
        case 10_000..<100_000_000:
            // 만 단위 (1.0만 ~ 9,999.9만)
            return String(format: "%.1f만", number / 10_000)
        default:
            // 억 단위 (1.0억 이상)
            return String(format: "%.1f억", number / 100_000_000)
        }
    }
}
