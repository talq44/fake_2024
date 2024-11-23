//
//  DetailPageError.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public enum DetailPageError: Error, Equatable {
    case rest(statusCode: Int)
    case undefined
}
