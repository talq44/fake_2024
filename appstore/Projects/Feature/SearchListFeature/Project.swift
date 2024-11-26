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
                .SPM.snapKit,
                .SPM.kingfisher,
                .feature(target: .SearchListFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
                .shared(target: .TalqDesignSystem, type: .implementation),
                .shared(target: .FoundationShared, type: .implementation),
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
        .preview(
            feature: .SearchListFeature,
            dependencies: [
                .SPM.swinject,
                .SPM.snapKit,
                .SPM.kingfisher,
                .feature(target: .SearchListFeature, type: .interface),
                .domain(target: .SearchListDomain, type: .interface),
                .shared(target: .TalqDesignSystem, type: .implementation),
                .shared(target: .FoundationShared, type: .implementation),
            ]
        )
    ]
)
