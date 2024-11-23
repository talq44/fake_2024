//
//  API+Parameters.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

extension API {
    public var path: String {
        switch self {
        case .get_search:
            return "/search"
            
        case .get_lookup:
            return "/lookup"
            
        case .get_searchs_word:
            return ""
            
        case .post_searchs_word:
            return ""
        }
    }
}
