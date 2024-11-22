//
//  Item.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public struct Item {
    public let item_id: String
    public let item_name: String
    
    public init(item_id: String, item_name: String) {
        self.item_id = item_id
        self.item_name = item_name
    }
}
