//
//  RestAPIError.swift
//  ErrorSharedInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

/// case rest(statusCode: Int)
public protocol RestAPIError: Error {
    static func rest(statusCode: Int) -> Self
}
