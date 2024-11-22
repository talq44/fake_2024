import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: CoreModule.AnalyticsCore.name,
    settings: .Module.default,
    targets: [
        .interface(
            core: .AnalyticsCore,
            dependencies: []
        ),
        .implementation(
            core: .AnalyticsCore,
            dependencies: [
                .core(target: .AnalyticsCore, type: .interface),
            ]
        ),
        .testing(
            core: .AnalyticsCore,
            dependencies: [
                .core(target: .AnalyticsCore, type: .interface),
            ]
        ),
        .tests(
            core: .AnalyticsCore,
            dependencies: [
                .core(target: .AnalyticsCore, type: .implementation),
                .core(target: .AnalyticsCore, type: .testing),
            ]
        ),
    ]
)
