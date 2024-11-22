//
//  ViewItemList.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public struct ViewItemList {
    public let items: [Item]
    public let item_list_id: String
    public let item_list_name: String
    
    public init(items: [Item], item_list_id: String, item_list_name: String) {
        self.items = items
        self.item_list_id = item_list_id
        self.item_list_name = item_list_name
    }
}
