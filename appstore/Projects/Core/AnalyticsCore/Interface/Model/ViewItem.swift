//
//  ViewItem.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

/// View Item event. This event signifies that a user has viewed an item. Use the appropriate parameters to contextualize the event. Use this event to discover the most popular items viewed in your app. Note: If you supply the VALUE parameter, you must also supply the CURRENCY parameter so that revenue metrics can be computed accurately.
/// - firebase: https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#VIEW_ITEM()
public struct ViewItem: Codable, Equatable {
    public let item_id: String
    public let item_name: String
    public let item_category: String
    public let item_brand: String
    public let item_list_id: String?
    public let item_list_name: String?
    
    public init(
        item_id: String,
        item_name: String,
        item_category: String,
        item_brand: String,
        item_list_id: String?,
        item_list_name: String?
    ) {
        self.item_id = item_id
        self.item_name = item_name
        self.item_category = item_category
        self.item_brand = item_brand
        self.item_list_id = item_list_id
        self.item_list_name = item_list_name
    }
}


