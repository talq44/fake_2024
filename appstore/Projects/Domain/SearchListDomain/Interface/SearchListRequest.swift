//
//  SearchListRequest.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListRequest {
    /// 검색어
    var term: String { get }
}
