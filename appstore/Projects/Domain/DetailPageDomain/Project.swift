import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.DetailPageDomain.name,
    settings: .Module.default,
    targets: [
        .interface(
            domain: .DetailPageDomain,
            dependencies: []
        ),
        .implementation(
            domain: .DetailPageDomain,
            dependencies: [
                .domain(target: .DetailPageDomain, type: .interface),
                .core(target: .UserAPICore, type: .interface),
                .SPM.swinject,
            ]
        ),
        .testing(
            domain: .DetailPageDomain,
            dependencies: [
                .domain(target: .DetailPageDomain, type: .interface),
                .core(target: .UserAPICore, type: .interface),
                .core(target: .UserAPICore, type: .testing),
                .SPM.swinject,
            ]
        ),
        .tests(
            domain: .DetailPageDomain,
            dependencies: [
                .domain(target: .DetailPageDomain, type: .implementation),
                .domain(target: .DetailPageDomain, type: .testing),
            ]
        ),
    ]
)
