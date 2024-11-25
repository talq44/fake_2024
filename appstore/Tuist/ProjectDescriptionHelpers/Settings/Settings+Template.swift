//
//  Settings+Template.swift
//  Manifests
//
//  Created by 박창규 on 11/21/24.
//

import ProjectDescription

public extension Settings {
    
    enum Application {
        public static let `default`: Settings = .settings(
            base: [:],
            configurations: ConfigurationTemplate.appConfigurations,
            defaultSettings: .recommended(excluding: ["ASSETCATALOG_COMPILER_APPICON_NAME"])
        )
    }
    
    enum Module {
        public static let `default`: Settings = .settings(
            base: ["OTHER_LDFLAGS": ["-Objc"]]
        )
    }
    
    enum Framework {
        public static let `default`: Settings =  .settings(base: SettingsDictionary()
            .otherLinkerFlags(["-ObjC"]))
    }
}
