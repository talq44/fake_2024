//
//  SearchListRepository.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

protocol SearchListRepository {
    func request(_ request: SearchListRequest) async -> SearchListEntity?
}
