//
//  SelectItem.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

/// Select Item event. This event signifies that an item was selected by a user from a list. Use the appropriate parameters to contextualize the event. Use this event to discover the most popular items selected.
/// - firebase: https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#SELECT_ITEM()
public struct SelectItem: Codable, Equatable {
    
    public let item_list_id: String
    public let item_list_name: String
    public let items: [Item]
    
    public init(
        item_list_id: String,
        item_list_name: String,
        items: [Item]
    ) {
        self.item_list_id = item_list_id
        self.item_list_name = item_list_name
        self.items = items
    }
}
