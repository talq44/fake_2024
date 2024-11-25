//
//  ViewItemUseCaseImpl.swift
//  ViewItemDomainInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import AnalyticsCoreInterface
import ViewItemDomainInterface

final class ViewItemUseCaseImpl: ViewItemUseCase {
    private let analytics: AnalyticsCoreInterface.AnalyticsSend
    
    init(analytics: AnalyticsCoreInterface.AnalyticsSend) {
        self.analytics = analytics
    }
    
    func execute(_ input: any ViewItemDomainInterface.ViewItemInput) {
        
        self.analytics.send(.view_item(ViewItem(
            item_id: input.item_id,
            item_name: input.item_name,
            item_category: input.item_category,
            item_brand: input.item_brand,
            item_list_id: input.item_list_id,
            item_list_name: input.item_list_name
        )))
    }
}
