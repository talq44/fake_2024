//
//  StubScreenViewOutput.swift
//  ScreenViewDomainTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import AnalyticsCoreTesting
import ScreenViewDomainInterface

struct StubScreenViewOutput {
    public let useCase: ScreenViewUseCase?
    public let analytics: AnalyticsCoreTesting.StubAnalyticsSend?
}
