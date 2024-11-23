//
//  SearchListResponse.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol SearchListOutput {
    var items: [SearchListItem] { get }
}
