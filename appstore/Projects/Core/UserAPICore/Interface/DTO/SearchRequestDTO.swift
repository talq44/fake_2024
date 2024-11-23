//
//  SearchRequestDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

public struct SearchRequestDTO: Encodable {
    public let term: String
    public let limit: Int
    public let offset: Int
    public let entity: String = "software"
    public let country: String = "KR"
    public let lang: String = "ko_kr"
    
    public init(term: String, limit: Int, offset: Int) {
        self.limit = limit
        self.term = term
        self.offset = offset
    }
}
