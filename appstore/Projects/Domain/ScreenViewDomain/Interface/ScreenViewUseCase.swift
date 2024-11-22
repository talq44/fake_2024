//
//  ScreenViewProtocol.swift
//  ScreenViewDomainInterface
//
//  Created by 박창규 on 11/22/24.
//

import Foundation

public protocol ScreenViewUseCase {
    func execute(page: Pages, screenAnyClass: AnyClass)
}
