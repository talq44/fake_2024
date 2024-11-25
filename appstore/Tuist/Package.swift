// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "Swinject":. framework,
        ]
    )
#endif

let package = Package(
    name: "appstore",
    platforms: [
        .iOS(.v17)
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.7.1")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.1.1")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.1")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.3")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.7.1")),
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", .upToNextMajor(from: "3.2.0")),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1"),
        .package(url: "https://github.com/vadymmarkov/Fakery", from: "5.0.0"),
    ]
)
