//
//  DetailPageRepository.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

internal protocol DetailPageRepository {
    func request(_ id: Int) async -> DetailPageEntity?
}
