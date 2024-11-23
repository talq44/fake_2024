//
//  SearchListRequest.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListInput {
    /// 검색어
    var term: String { get }
}
