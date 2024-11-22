//
//  StubScreenViewUseCase.swift
//  ScreenViewDomainTesting
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

import ScreenViewDomainInterface

final class StubScreenViewUseCase: ScreenViewUseCase {
    var page: ScreenViewDomainInterface.Pages?
    var screenAnyClass: AnyClass?
    
    func execute(
        page: ScreenViewDomainInterface.Pages,
        screenAnyClass: AnyClass
    ) {
        self.page = page
        self.screenAnyClass = screenAnyClass
    }
}
