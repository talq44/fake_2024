//
//  RestAPIErrorImpl.swift
//  ErrorSharedInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import ErrorSharedInterface

enum RestAPIErrorImpl: Error, RestAPIError, Equatable {
    case rest(statusCode: Int)
}
