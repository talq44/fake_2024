import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: CoreModule.UserAPICore.name,
    settings: .Module.default,
    targets: [
        .interface(
            core: .UserAPICore,
            dependencies: []
        ),
        .implementation(
            core: .UserAPICore,
            dependencies: [
                .core(target: .UserAPICore, type: .interface),
                .SPM.moya,
                .SPM.alamofire,
                .SPM.swinject,
            ]
        ),
        .testing(
            core: .UserAPICore,
            dependencies: [
                .SPM.swinject,
                .core(target: .UserAPICore, type: .interface),
            ]
        ),
        .tests(
            core: .UserAPICore,
            dependencies: [
                .core(target: .UserAPICore, type: .implementation),
                .core(target: .UserAPICore, type: .testing),
                .core(target: .UserAPICore, type: .interface),
            ]
        ),
    ]
)
