//
//  ViewItemUseCase.swift
//  ViewItemDomainInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

public protocol ViewItemUseCase {
    func execute(_ input: ViewItemInput)
}
