import ProjectDescription

let project = Project(
    name: "UserAPI",
    targets: [
        .target(
            name: "UserAPI",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UserAPI",
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
