//
//  ScreenViewUseCaseImpl.swift
//  ScreenViewDomainInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreInterface
import ScreenViewDomainInterface

final internal class ScreenViewUseCaseImpl: ScreenViewUseCase {
    
    private let analytics: AnalyticsCoreInterface.AnalyticsSend
    
    init(analytics: AnalyticsCoreInterface.AnalyticsSend) {
        self.analytics = analytics
    }
    
    func execute(
        page: ScreenViewDomainInterface.Pages,
        screenAnyClass: AnyClass
    ) {
        let className = NSStringFromClass(screenAnyClass)
        let components = className.components(separatedBy: ".")
        let screenClass: String = components.last ?? "unknown"
        
        let screenView = ScreenView(
            screen_class: screenClass,
            screen_name: page.rawValue
        )
        
        self.analytics.send(AnalyticsEvent.screen_view(screenView))
    }
}
