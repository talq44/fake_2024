//
//  DetailPageItem.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import DetailPageDomainInterface

struct DetailPageItem: DetailPageOutput {
    let id: String
    let name: String
    let thumbnailURL: String
    let salesName: String
    let description: String
}
