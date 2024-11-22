import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugin/TemplatePlugin"))
    ],
    generationOptions: .options()
)
