import ProjectDescription

let project = Project(
    name: "appstore",
    targets: [
        .target(
            name: "appstore",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.appstore",
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
