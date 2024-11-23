//
//  DetailPageOutput.swift
//  DetailPageDomainInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

public protocol DetailPageOutput {
    var id: String { get }
    var name: String { get }
    var thumbnailURL: String { get }
    var salesName: String  { get }
    
    var description: String { get }
}
