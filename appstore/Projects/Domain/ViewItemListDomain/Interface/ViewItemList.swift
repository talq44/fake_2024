//
//  ViewItemList.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol ViewItemList {
    var items: [Item] { get }
    var item_list_id: String { get }
    var item_list_name: String { get }
}
