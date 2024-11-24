//
//  TargetDependency+SPM+Template.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

public extension TargetDependency {
    
    enum SPM {
        // DI
        public static let swinject: TargetDependency = .external(name: "Swinject")
        
        // UI
        public static let snapKit: TargetDependency = .external(name: "SnapKit")
        public static let kingfisher: TargetDependency = .external(name: "Kingfisher")
        
        // Rx
        public static let rxSwift: TargetDependency = .external(name: "RxSwift")
        public static let rxCocoa: TargetDependency = .external(name: "RxCocoa")
        public static let reactorKit: TargetDependency = .external(name: "ReactorKit")
        
        // Network
        public static let alamofire: TargetDependency = .external(name: "Alamofire")
        public static let moya: TargetDependency = .external(name: "Moya")
        
        // Testable
        public static let fakery: TargetDependency = .external(name: "Fakery")
    }
}
