import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "appstore",
    targets: [
        .target(
            name: "appstore",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.appstore",
            deploymentTargets: .appVersion,
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            dependencies: []
        ),
        .target(
            name: "appstoreTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.appstoreTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "appstore")]
        ),
    ]
)
