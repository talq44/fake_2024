//
//  TargetDependency+SPM+Template.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

public extension TargetDependency {
    
    enum SPM {
        public static let swinject: TargetDependency = .external(name: "Swinject")
        
        // UI
        public static let snapKit: TargetDependency = .external(name: "SnapKit")
        public static let kingfisher: TargetDependency = .external(name: "Kingfisher")
        
        // Rx
        public static let rxBlocking: TargetDependency = .external(name: "RxBlocking")
        public static let rxSwift: TargetDependency = .external(name: "RxSwift")
        public static let rxCocoa: TargetDependency = .external(name: "RxCocoa")
        public static let rxMoya: TargetDependency = .external(name: "RxMoya")
        public static let rxDataSources: TargetDependency = .external(name: "RxDataSources")
        public static let rxGesture: TargetDependency = .external(name: "RxGesture")
        public static let reactorKit: TargetDependency = .external(name: "ReactorKit")
        
        // Network
        public static let alamofire: TargetDependency = .external(name: "Alamofire")
        public static let moya: TargetDependency = .external(name: "Moya")
        
        // Testable
        public static let quick: TargetDependency = .external(name: "Quick")
        public static let nimble: TargetDependency = .external(name: "Nimble")
        public static let snapshotTesting: TargetDependency = .external(name: "SnapshotTesting")
    }
}
