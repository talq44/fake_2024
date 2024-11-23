//
//  SearchListOutputImpl.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import SearchListDomainInterface

struct SearchListOutputImpl: SearchListOutput {
    let items: [any SearchListItem]
}
