// swift-tools-version: 5.9
import PackageDescription
import ProjectDescription

#if TUIST
let packageSettings = PackageSettings(
    // Customize the product types for specific package product
    // Default is .staticFramework
    // productTypes: ["Alamofire": .framework,]
    productTypes: [:]
)
#endif

let package = Package(
    name: "appstore",
    platforms: [
        .iOS("15.0"),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.0")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/Quick/nimble.git", .upToNextMajor(from: "13.5.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxGesture.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMajor(from: "4.5.0")),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        
    ]
)
