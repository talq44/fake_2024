//
//  StubSearchListEntity.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import SearchListDomainInterface

struct StubSearchListEntity: SearchListEntity {
    var totalCount: Int
    
    var items: [any SearchListDomainInterface.SearchListItem]
}
