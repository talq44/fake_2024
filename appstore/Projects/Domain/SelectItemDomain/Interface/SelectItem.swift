//
//  SelectItem.swift
//  SelectItemDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SelectItem {
    var item_list_id: String { get }
    var item_list_name: String { get }
    var items: [SelectItemItem] { get }
}
