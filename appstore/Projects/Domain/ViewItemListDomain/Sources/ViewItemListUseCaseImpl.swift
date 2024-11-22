//
//  ViewItemListUseCaseImpl.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import AnalyticsCoreInterface
import ViewItemListDomainInterface

final class ViewItemListUseCaseImpl: ViewItemListUseCase {
    private let analytics: AnalyticsCoreInterface.AnalyticsSend
    
    init(analytics: AnalyticsCoreInterface.AnalyticsSend) {
        self.analytics = analytics
    }
    
    func execute(
        _ viewItemList: ViewItemListDomainInterface.ViewItemList
    ) {
        // 0개면 보내지 않는다.
        guard viewItemList.items.count > 0 else {
            return
        }
        
        let viewItemList = AnalyticsCoreInterface.ViewItemList(
            item_list_id: viewItemList.item_list_id,
            item_list_name: viewItemList.item_list_name,
            items: viewItemList.items.map { item in
                return AnalyticsCoreInterface.Item(
                    item_id: item.item_id,
                    item_name: item.item_name
                )
            }
        )
        
        self.analytics.send(.view_item_list(viewItemList))
    }
}
