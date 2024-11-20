import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ReactiveX",
    targets: [
        .target(
            name: "ReactiveX",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.ReactiveX",
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
            dependencies: [
                .SPM.rxSwift,
                .SPM.rxCocoa,
                .SPM.rxGesture,
                .SPM.rxDataSources,
                .SPM.reactorKit,
            ]
        ),
    ]
)
