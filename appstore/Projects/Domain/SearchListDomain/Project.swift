import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.SearchListDomain.name,
    settings: .Module.default,
    targets: [
        .interface(
            domain: .SearchListDomain,
            dependencies: []
        ),
        .implementation(
            domain: .SearchListDomain,
            dependencies: [
                .domain(target: .SearchListDomain, type: .interface),
                .core(target: .UserAPICore, type: .interface),
                .SPM.swinject,
            ]
        ),
        .testing(
            domain: .SearchListDomain,
            dependencies: [
                .domain(target: .SearchListDomain, type: .interface),
                .core(target: .UserAPICore, type: .testing),
                .SPM.swinject,
                .SPM.fakery,
            ]
        ),
        .tests(
            domain: .SearchListDomain,
            dependencies: [
                .domain(target: .SearchListDomain, type: .implementation),
                .domain(target: .SearchListDomain, type: .testing),
            ]
        ),
    ]
)
