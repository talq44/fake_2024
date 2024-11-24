import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: SharedModule.TalqDesignSystem.name,
    settings: .Module.default,
    targets: [
        .implementation(
            shared: .TalqDesignSystem,
            dependencies: [
                
            ]
        ),
        .tests(
            shared: .TalqDesignSystem,
            dependencies: [
                .shared(target: .TalqDesignSystem, type: .implementation),
            ]
        ),
    ]
)
