//
//  SearchListError.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public enum SearchListError: Error, Equatable {
    case restError(statusCode: Int)
    /// 더보기 요청 전 패치 요청 필요
    case fetchRequiredBeforeMore
    case unDefined
}
