import Foundation

let examples: [ExampleSection] = [
    ExampleSection(title: "Controls", examples: [
        SwiftExample(title: "Switch", storyboard: "controls", identifier: "SwitchViewController")
    ]),
    ExampleSection(title: "Views", examples: [
        SwiftExample(title: "Collection", storyboard: "views", identifier: "CollectionViewController")
    ])
]

struct ExampleSection {
    let title: String
    let examples: [SwiftExample]
}

struct SwiftExample {
    let title: String
    let storyboard: String
    let identifier: String
}
