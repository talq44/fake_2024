//
//  Encodable+Extension.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

extension Encodable {
    
    func jsonData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func jsonString() -> String {
        guard let data = jsonData() else { return "" }
        return String.init(data: data, encoding: .utf8) ?? ""
    }
    
    /// 파라미터로 컨버팅
    func parameters() -> [String: Any] {
        guard let data = self.jsonData() else { return [:] }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return [:] }
        guard let dic = json as? [String: Any] else { return [:] }
        
        return dic
    }
}

