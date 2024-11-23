//
//  SearchListError.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public enum SearchListError: Error, Equatable {
    case restError(statusCode: Int)
    case unDefined
}
