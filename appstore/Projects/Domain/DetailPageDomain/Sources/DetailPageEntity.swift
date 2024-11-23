//
//  DetailPageEntity.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

struct DetailPageEntity {
    let items: [DetailPageItem]
    
    let statusCode: Int?
    
    init(items: [DetailPageItem]) {
        self.items = items
        self.statusCode = nil
    }
    
    init (statusCode: Int) {
        self.items = []
        self.statusCode = statusCode
    }
}
