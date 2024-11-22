#!/usr/bin/swift
import Foundation

let fileManager = FileManager.default
let currentPath = "./"
let bash = Bash()

// MARK: - Start Feature Create

print("\n🔧 모듈 Layer을(를) 입력해 주세요.\nex) Feature, Domain, Core, Shared : ", terminator: "")

// Layer 입력

guard let layerName = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
    print("실패")
    exit(1)
}

guard !layerName.isEmpty else {
    print("Layer 입력값이 공백입니다. 다시 시도해 주세요😃")
    exit(1)
}

print("\n\n✅ 입력된 layer : \(layerName.lowercased()) 😃\n\n")
guard let layerType = ModuleLayer(rawValue: layerName.lowercased()) else {
    print("매칭된 layer type이 존재하지 않습니다.😃")
    exit(1)
}

// Module 이름 입력
print("⚒️ 모듈 name을(를) 입력해 주세요.\nex) ProductFeature, HomeFeature, ReviewDomain : \n", terminator: "")

guard let moduleName = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
    print("실패")
    exit(1)
}

guard !moduleName.isEmpty else {
    print("moduleName 입력값이 공백입니다. 다시 시도해 주세요😃")
    exit(1)
}

makeModule(layerType, moduleName: moduleName)

// MARK: - Define

func makeModule(_ layerType: ModuleLayer, moduleName: String) {
    let moduleCases: [ModuleType]

    switch layerType {
    case .feature:
        moduleCases = ModuleType.featureCases
    case .domain:
        moduleCases = ModuleType.domainCases
    case .core:
        moduleCases = ModuleType.coreCases
    case .shared:
        moduleCases = ModuleType.sharedCases
    }

    print("🚀 \(layerType.name) Layer에서 \(moduleName) 모듈 생성을 시작합니다.\n")

    moduleCases.forEach { module in
        makeScaffold(target: module, layer: layerType, moduleName: moduleName)
        print("📁 \(module.name) 모듈의 구조가 생성되었습니다.")
    }
    
    let targetString = target(moduleTypes: moduleCases, layer: layerType, name: moduleName)
    createProject(layer: layerType, targetString: targetString, name: moduleName)

    // Enum에 새 케이스 추가
    updateModuleEnum(layerType: layerType, moduleName: moduleName)

    print("\n🎉 \(layerType.name) Layer에서 \(moduleName) 모듈 생성이 완료되었습니다. 모든 파일이 준비되었습니다! 😃")
}

func makeScaffold(target: ModuleType, layer: ModuleLayer, moduleName: String) {
    _ = try? bash.run(
        command: "tuist",
        arguments: ["scaffold", "\(target.name)", "--name", "\(moduleName)", "--layer", "\(layer.name)"]
    )
}

enum ModuleLayer: String {
    case feature
    case domain
    case core
    case shared

    var module: String {
        switch self {
        case .feature: return "FeatureModule"
        case .domain: return "DomainModule"
        case .core: return "CoreModule"
        case .shared: return "SharedModule"
        }
    }

    var name: String {
        self.rawValue.capitalized
    }
}

enum ModuleType: String {
    case interface
    case implementation
    case testing
    case tests
    case demo
    
    var name: String {
        self.rawValue.capitalized
    }
    
    static var featureCases: [ModuleType] = [
        .interface, .implementation, .testing, .tests, .demo,
    ]
    
    static var domainCases: [ModuleType] = [
        .interface, .implementation, .testing, .tests,
    ]
    
    static var coreCases: [ModuleType] = [
        .interface, .implementation, .testing, .tests,
    ]
    
    static var sharedCases: [ModuleType] = [
        .interface, .implementation, .testing, .tests,
    ]
}

func tab(_ count: Int) -> String {
    return String(repeating: "\t", count: count)
}

func target(
    moduleTypes: [ModuleType],
    layer: ModuleLayer,
    name: String
) -> String {
    
    var targetString: String = ""
    
    for moduleType in moduleTypes {
        
        switch moduleType {
        case .interface:
            targetString += """
            \n\(tab(2)).interface(
            \(tab(3))\(layer.rawValue): .\(name),
            \(tab(2))\tdependencies: []
            \(tab(2))),
            """
            
        case .implementation:
            targetString += """
            \n\(tab(2)).implementation(
            \(tab(3))\(layer.rawValue): .\(name),
            \(tab(3))dependencies: [
            \(tab(4)).\(layer)(target: .\(name), type: .interface),
            \(tab(3))]
            \(tab(2))),
            """
            
        case .testing:
            targetString += """
            \n\(tab(2)).testing(
            \(tab(3))\(layer.rawValue): .\(name),
            \(tab(3))dependencies: [
            \(tab(4)).\(layer)(target: .\(name), type: .interface),
            \(tab(3))]
            \(tab(2))),
            """
            
        case .tests:
            targetString += """
            \n\(tab(2)).tests(
            \(tab(3))\(layer.rawValue): .\(name),
            \(tab(3))dependencies: [
            \(tab(4)).\(layer)(target: .\(name), type: .implementation),
            \(tab(4)).\(layer)(target: .\(name), type: .testing),
            \(tab(3))]
            \(tab(2))),
            """
            
        case .demo:
            targetString += """
            \n\(tab(2)).demo(
            \(tab(3))\(layer.rawValue): .\(name),
            \(tab(3))dependencies: [
            \(tab(4)).\(layer)(target: .\(name), type: .implementation),
            \(tab(4)).\(layer)(target: .\(name), type: .testing),
            \(tab(3))]
            \(tab(2))),
            """
        }
    }
    
    return targetString
}

// MARK: - Create project

func createProject(
    layer: ModuleLayer,
    targetString: String,
    name: String
) {
    
    let proejct = """
    import ProjectDescription
    import ProjectDescriptionHelpers

    let project = Project.module(
        name: \(layer.module).\(name).name,
        settings: .Module.default,
        targets: [\(targetString)\n]
    )
    """
    
    writeContentInFile(
        path: currentPath + "Projects/\(layer.name)/\(name)/Project.swift",
        content: proejct
    )

    print("📂 \(name) 모듈의 프로젝트 설정 파일(Project.swift)이 생성되었습니다.")
}

func writeContentInFile(path: String, content: String) {
    let fileURL = URL(fileURLWithPath: path)
    let data = Data(content.utf8)
    try? data.write(to: fileURL)
}

// MARK: - Update Module Enum

func updateModuleEnum(layerType: ModuleLayer, moduleName: String) {
    let filePath = currentPath + "Tuist/ProjectDescriptionHelpers/Modules/\(layerType.module).swift"
    
    // 파일 읽기
    guard var fileContent = try? String(contentsOfFile: filePath) else {
        print("❗️ \(filePath) 파일을 읽는 데 실패했습니다. 파일이 존재하는지 확인해 주세요.")
        return
    }
    
    // enum 블록을 찾아서 새로운 케이스 추가
    let enumKeyword = "public enum \(layerType.module): String, CaseIterable {"
    let caseLine = "\n\(tab(1))case \(moduleName)"

    // enum 시작 부분을 찾아서 케이스 추가
    if let enumRange = fileContent.range(of: enumKeyword) {
        // 케이스를 추가할 위치를 찾음 (enum 블록 바로 뒤)
        if let insertIndex = fileContent.range(of: "\n", range: enumRange.upperBound..<fileContent.endIndex)?.lowerBound {
            // 파일에 이미 해당 케이스가 있는지 확인
            if fileContent.contains(caseLine) {
                print("⚠️ \(layerType.name) 모듈에 \(moduleName) 케이스가 이미 존재합니다.")
            } else {
                // 케이스 추가
                fileContent.insert(contentsOf: caseLine, at: insertIndex)
            }
        }
    } else {
        print("❗️ \(layerType.module) enum을 찾지 못했습니다.")
        return
    }
    
    // 파일 쓰기
    do {
        try fileContent.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("✅ \(layerType.module) 모듈에 \(moduleName) 케이스가 성공적으로 추가되었습니다.")
    } catch {
        print("❗️ \(filePath) 파일에 쓰는 데 실패했습니다.")
    }
}

// MARK: - Bash

protocol CommandExecuting {
    func run(command: String, arguments: [String]) throws -> String
}

enum BashError: Error {
    case commandNotFound(name: String)
}

struct Bash: CommandExecuting {
    
    func run(command: String, arguments: [String] = []) throws -> String {
        return try run(resolve(command), with: arguments)
    }

    private func resolve(_ command: String) throws -> String {
        guard var bashCommand = try? run("/bin/bash", with: ["-l", "-c", "which \(command)"]) else {
            throw BashError.commandNotFound(name: command)
        }
        bashCommand = bashCommand.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return bashCommand
    }

    private func run(_ command: String, with arguments: [String] = []) throws -> String {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments

        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        return output
    }
}
