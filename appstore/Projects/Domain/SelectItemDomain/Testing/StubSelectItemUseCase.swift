//
//  StubSelectItemUseCase.swift
//  SelectItemDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SelectItemDomainInterface

final class StubSelectItemUseCase: SelectItemUseCase {
    var item: (any SelectItem)?
    
    func execute(_ item: any SelectItemDomainInterface.SelectItem) {
        self.item = item
    }
}
