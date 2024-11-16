//
//  CoreModule.swift
//  ProjectDescriptionHelpers
//
//

import ProjectDescription

public enum DomainModule: String, CaseIterable {
    case Detail
    case LikeAdd
    case SearchList
    case SelectItem
    case ViewItem
    
    public var name: String {
        self.rawValue
    }
}
