//
//  StubViewItmeListUseCase.swift
//  ViewItemListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import ViewItemListDomainInterface

import Swinject

final class StubViewItmeListUseCase: ViewItemListUseCase {
    var viewItemList: ViewItemListDomainInterface.ViewItemList?
    
    func execute(_ viewItemList: ViewItemListDomainInterface.ViewItemList) {
        self.viewItemList = viewItemList
    }
}
