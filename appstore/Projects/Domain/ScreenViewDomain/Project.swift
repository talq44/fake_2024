import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: DomainModule.ScreenViewDomain.name,
    settings: .Module.default,
    targets: [
		.interface(
			domain: .ScreenViewDomain,
			dependencies: [
                .core(target: .AnalyticsCore, type: .interface),
            ]
		),
		.implementation(
			domain: .ScreenViewDomain,
			dependencies: [
                .SPM.swinject,
                .core(target: .AnalyticsCore, type: .interface),
				.domain(target: .ScreenViewDomain, type: .interface),
			]
		),
		.testing(
			domain: .ScreenViewDomain,
			dependencies: [
                .SPM.swinject,
                .core(target: .AnalyticsCore, type: .testing),
				.domain(target: .ScreenViewDomain, type: .interface),
			]
		),
		.tests(
			domain: .ScreenViewDomain,
			dependencies: [
				.domain(target: .ScreenViewDomain, type: .implementation),
				.domain(target: .ScreenViewDomain, type: .testing),
			]
		),
]
)
