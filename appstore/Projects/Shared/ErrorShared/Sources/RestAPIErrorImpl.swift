//
//  RestAPIErrorImpl.swift
//  ErrorSharedInterface
//
//  Created by 박창규 on 11/25/24.
//

import Foundation

import ErrorSharedInterface

enum RestAPIErrorImpl: Error, RestAPIError {
    case rest(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .rest(let statusCode):
            return "status Code \(statusCode) 이슈가 발생해 작업을 완료할 수 없습니다."
        }
    }
}
