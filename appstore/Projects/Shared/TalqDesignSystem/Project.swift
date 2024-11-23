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
        .testing(
            shared: .TalqDesignSystem,
            dependencies: [
                .shared(target: .TalqDesignSystem, type: .interface),
            ]
        ),
        .tests(
            shared: .TalqDesignSystem,
            dependencies: [
                .shared(target: .TalqDesignSystem, type: .implementation),
                .shared(target: .TalqDesignSystem, type: .testing),
            ]
        ),
    ]
)
