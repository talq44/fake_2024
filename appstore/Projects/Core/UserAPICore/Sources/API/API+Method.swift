//
//  API+Method.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

import Moya

extension API {
    public var method: Moya.Method {
        switch self {
        case .get_lookup:
            return .get
            
        case .get_search:
            return .get
            
        case .get_searchs_word:
            return .get
            
        case .post_searchs_word:
            return .post
        }
    }
}
