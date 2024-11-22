//
//  AnalyticsEvent.swift
//  AnalyticsCoreInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

public enum AnalyticsEvent: Equatable {
    /// 화면 노출
    case screen_view(ScreenView)
    /// 목록에서 항목 선택
    case select_item(SelectItem)
    /// 항목 노출
    case view_item(ViewItem)
    /// 목록 노출
    case view_item_list(ViewItemList)
}
