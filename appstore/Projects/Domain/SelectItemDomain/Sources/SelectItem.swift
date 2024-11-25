//
//  SelectItem.swift
//  SelectItemDomain
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import SelectItemDomainInterface

struct SelectItem: SelectItemDomainInterface.SelectItem {
    var item_list_id: String
    
    var item_list_name: String
    
    var items: [any SelectItemDomainInterface.SelectItemItem]
    
    struct Item: SelectItemDomainInterface.SelectItemItem {
        var item_id: String
        
        var item_name: String
    }
}
