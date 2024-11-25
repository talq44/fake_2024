import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.ViewItemListDomain.name,
    settings: .Module.default,
    targets: [
		.interface(
			domain: .ViewItemListDomain,
			dependencies: []
		),
		.implementation(
			domain: .ViewItemListDomain,
			dependencies: [
                .SPM.swinject,
                .core(target: .AnalyticsCore, type: .interface),
				.domain(target: .ViewItemListDomain, type: .interface),
			]
		),
		.testing(
			domain: .ViewItemListDomain,
			dependencies: [
				.domain(target: .ViewItemListDomain, type: .interface),
                .core(target: .AnalyticsCore, type: .interface),
			]
		),
		.tests(
			domain: .ViewItemListDomain,
			dependencies: [
				.domain(target: .ViewItemListDomain, type: .implementation),
				.domain(target: .ViewItemListDomain, type: .testing),
			]
		),
]
)
