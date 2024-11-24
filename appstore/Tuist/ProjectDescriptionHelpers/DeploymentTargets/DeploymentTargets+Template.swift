//
//  DeploymentTargets+Template.swift
//  Manifests
//
//  Created by 박창규 on 11/20/24.
//

import ProjectDescription

extension DeploymentTargets {
    /// 모든 프로젝트는 단 하나의 버전을 사용합니다.
    /// 현재 버전 - 17.0
    public static var appVersion: DeploymentTargets {
        return .iOS("17.0")
    }
}
