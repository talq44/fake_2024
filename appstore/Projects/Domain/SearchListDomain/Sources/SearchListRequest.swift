//
//  SearchListRequest.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

struct SearchListRequest {
    let query: String
    let limit: Int
    let offset: Int
}
