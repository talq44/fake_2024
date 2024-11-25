//
//  SearchListEntity.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

public protocol SearchListEntity {
    var totalCount: Int { get }
    var items: [SearchListItem] { get }
}
