//
//  API+Task.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

import UserAPICoreInterface

import Moya

extension API {
    public var task: Task {
        switch self {
        case .get_search(let request):
            return .requestParameters(
                parameters: request.parameters(),
                encoding: URLEncoding.queryString
            )
            
        case .get_lookup(let request):
            return .requestParameters(
                parameters: request.parameters(),
                encoding: URLEncoding.queryString
            )
            
        case .get_searchs_word:
            return .requestPlain
            
        case .post_searchs_word:
            return .requestPlain
        }
    }
}
