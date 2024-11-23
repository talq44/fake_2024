//
//  Item.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol Item {
    var item_id: String { get }
    var item_name: String { get }
}
