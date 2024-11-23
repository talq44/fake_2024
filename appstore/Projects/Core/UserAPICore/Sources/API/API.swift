//
//  API.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

import UserAPICoreInterface

import Moya

public enum API {
    case get_search(request: SearchRequestDTO)
    case get_lookup(request: LookupRequestDTO)
    case get_searchs_word
    case post_searchs_word(word: String)
}

extension API: Moya.TargetType {
    public var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
}
