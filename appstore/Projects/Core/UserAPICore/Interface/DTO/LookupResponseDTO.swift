//
//  LookupResponseDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation


public struct LookupResponseDTO: Decodable {
    public let resultCount: Int
    public let results: [LookupResultDTO]
}
