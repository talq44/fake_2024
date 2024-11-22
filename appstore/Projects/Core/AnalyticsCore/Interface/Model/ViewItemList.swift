//
//  ViewItemList.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

/// View Item List event. Log this event when a user sees a list of items or offerings
/// - firebase: https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#VIEW_ITEM_LIST()
public struct ViewItemList: Codable, Equatable {
    
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
