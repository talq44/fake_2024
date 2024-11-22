//
//  ViewItemListInput.swift
//  ViewItemListDomain
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import ViewItemListDomainInterface

struct ViewItemListInput: ViewItemListDomainInterface.ViewItemList {
    public let items: [any ViewItemListDomainInterface.Item]
    public let item_list_id: String
    public let item_list_name: String
    
    init(
        items: [any ViewItemListDomainInterface.Item],
        item_list_id: String,
        item_list_name: String
    ) {
        self.items = items
        self.item_list_id = item_list_id
        self.item_list_name = item_list_name
    }
}

public struct Item: ViewItemListDomainInterface.Item {
    public let item_id: String
    public let item_name: String
    
    public init(item_id: String, item_name: String) {
        self.item_id = item_id
        self.item_name = item_name
    }
}
