import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: SharedModule.FoundationShared.name,
    settings: .Module.default,
    targets: [
        .implementation(
            shared: .FoundationShared,
            dependencies: [
                
            ]
        ),
        .tests(
            shared: .FoundationShared,
            dependencies: [
                .shared(target: .FoundationShared, type: .implementation),
            ]
        ),
    ]
)
