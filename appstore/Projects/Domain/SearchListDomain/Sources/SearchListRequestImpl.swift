//
//  SearchListRequestImpl.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import SearchListDomainInterface

struct SearchListRequestImpl: SearchListRequest {
    let query: String
    let limit: Int
    let offset: Int
}
