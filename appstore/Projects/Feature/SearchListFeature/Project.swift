import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: FeatureModule.SearchListFeature.name,
    settings: .Module.default,
    targets: [
        .interface(
            feature: .SearchListFeature,
            dependencies: []
        ),
        .implementation(
            feature: .SearchListFeature,
            dependencies: [
                .SPM.swinject,
                .feature(target: .SearchListFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
            ]
        ),
        .testing(
            feature: .SearchListFeature,
            dependencies: [
                .SPM.swinject,
                .feature(target: .SearchListFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
                .domain(target: .SearchListDomain, type: .testing),
            ]
        ),
        .tests(
            feature: .SearchListFeature,
            dependencies: [
                .feature(target: .SearchListFeature, type: .implementation),
                .feature(target: .SearchListFeature, type: .testing),
            ]
        ),
        .demo(
            feature: .SearchListFeature,
            dependencies: [
                .feature(target: .SearchListFeature, type: .implementation),
                .feature(target: .SearchListFeature, type: .testing),
            ]
        ),
    ]
)
