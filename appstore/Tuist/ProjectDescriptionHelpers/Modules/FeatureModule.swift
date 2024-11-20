//
//  FeatureModule.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//


import ProjectDescription

public enum FeatureModule: String, CaseIterable {
    case SearchListFeature
    case ItemDetailFeature
    
    public var name: String {
        self.rawValue
    }
}
