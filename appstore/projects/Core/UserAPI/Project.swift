import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "UserAPI",
    targets: [
        .target(
            name: "UserAPI",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UserAPI",
            deploymentTargets: .oneVersion(),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            dependencies: [
                .SPM.alamofire,
                .SPM.moya
            ]
        ),
        .target(
            name: "UserAPITests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.UserAPITests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "UserAPI")]
        ),
    ]
)
