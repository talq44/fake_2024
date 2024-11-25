//
//  ViewItemInput.swift
//  ViewItemDomainInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

public protocol ViewItemInput {
    var item_id: String { get }
    var item_name: String { get }
    var item_category: String { get }
    var item_brand: String { get }
    var item_list_id: String? { get }
    var item_list_name: String? { get }
}
