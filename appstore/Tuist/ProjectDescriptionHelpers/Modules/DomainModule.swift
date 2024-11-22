//
//  DomainModule.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

public enum DomainModule: String, CaseIterable {
	case SelectItemDomain
	case ScreenViewDomain
    case ProductDetailDomain
    
    public var name: String {
        self.rawValue
    }
}
