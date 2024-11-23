//
//  CoreModule.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

public enum CoreModule: String, CaseIterable {
	case UserAPICore
	case AnalyticsCore
    
    public var name: String {
        self.rawValue
    }
}
