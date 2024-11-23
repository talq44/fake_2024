//
//  LookupRequestDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

public struct LookupRequestDTO: Encodable {
    public let id: Int
    public let entity: String = "software"
    public let country: String = "KR"
    public let lang: String = "ko_kr"
    
    public init(id: Int) {
        self.id = id
    }
}
