//
//  DetailPageUseCase.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol DetailPageUseCase {
    func execute(
        _ input: DetailPageInput
    ) async -> Result<DetailPageOutput, DetailPageError>
}
