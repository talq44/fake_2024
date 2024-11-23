//
//  StubSearchListOutput.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

struct StubSearchListOutput: SearchListOutput {
    let items: [any SearchListDomainInterface.SearchListItem]
}
