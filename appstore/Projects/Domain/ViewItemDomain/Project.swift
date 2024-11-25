import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.ViewItemDomain.name,
    settings: .Module.default,
    targets: [
		.interface(
			domain: .ViewItemDomain,
			dependencies: []
		),
		.implementation(
			domain: .ViewItemDomain,
			dependencies: [
				.domain(target: .ViewItemDomain, type: .interface),
                .core(target: .AnalyticsCore, type: .interface),
			]
		),
		.testing(
			domain: .ViewItemDomain,
			dependencies: [
				.domain(target: .ViewItemDomain, type: .interface),
			]
		),
		.tests(
			domain: .ViewItemDomain,
			dependencies: [
				.domain(target: .ViewItemDomain, type: .implementation),
				.domain(target: .ViewItemDomain, type: .testing),
			]
		),
]
)
