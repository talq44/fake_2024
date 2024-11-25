import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: SharedModule.ErrorShared.name,
    settings: .Module.default,
    targets: [
		.interface(
			shared: .ErrorShared,
			dependencies: []
		),
		.implementation(
			shared: .ErrorShared,
			dependencies: [
				.shared(target: .ErrorShared, type: .interface),
			]
		),
		.testing(
			shared: .ErrorShared,
			dependencies: [
				.shared(target: .ErrorShared, type: .interface),
			]
		),
		.tests(
			shared: .ErrorShared,
			dependencies: [
				.shared(target: .ErrorShared, type: .implementation),
				.shared(target: .ErrorShared, type: .testing),
			]
		),
]
)