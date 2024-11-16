//
//  CoreModule.swift
//  ProjectDescriptionHelpers
//
//

import ProjectDescription

public enum CoreModule: String, CaseIterable {
    case APIs
    case Analytics
    
    public var name: String {
        self.rawValue
    }
}
