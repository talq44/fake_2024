import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.SelectItemDomain.name,
    settings: .Module.default,
    targets: [
        .interface(
            domain: .SelectItemDomain,
            dependencies: []
        ),
        .implementation(
            domain: .SelectItemDomain,
            dependencies: [
                .SPM.swinject,
                .domain(target: .SelectItemDomain, type: .interface),
                .core(target: .AnalyticsCore, type: .interface),
            ]
        ),
        .testing(
            domain: .SelectItemDomain,
            dependencies: [
                .SPM.swinject,
                .domain(target: .SelectItemDomain, type: .interface),
                .core(target: .AnalyticsCore, type: .testing)
            ]
        ),
        .tests(
            domain: .SelectItemDomain,
            dependencies: [
                .domain(target: .SelectItemDomain, type: .implementation),
                .domain(target: .SelectItemDomain, type: .testing),
            ]
        ),
    ]
)
