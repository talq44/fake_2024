//
//  SearchListRequest.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

public protocol SearchListRequest {
    var query: String { get }
    var limit: Int { get }
    var offset: Int { get }
}
