//
//  SelectItemUseCaseImpl.swift
//  SelectItemDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import AnalyticsCoreInterface
import SelectItemDomainInterface

final class SelectItemUseCaseImpl: SelectItemUseCase {
    
    private let analytics: AnalyticsCoreInterface.AnalyticsSend
    
    init(analytics: AnalyticsCoreInterface.AnalyticsSend) {
        self.analytics = analytics
    }
    
    func execute(_ item: any SelectItemDomainInterface.SelectItem) {
        let selectItem = AnalyticsCoreInterface.SelectItem(
            item_list_id: item.item_list_id,
            item_list_name: item.item_list_name,
            items: item.items.map { item in
                return AnalyticsCoreInterface.Item(
                    item_id: item.item_id,
                    item_name: item.item_name
                )
            }
        )
    }
}
