//
//  Item.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

public struct Item: Codable {
    public let item_id: String
    public let item_name: String
    
    public init(item_id: String, item_name: String) {
        self.item_id = item_id
        self.item_name = item_name
    }
}
