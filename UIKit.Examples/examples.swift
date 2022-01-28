import Foundation

let examples: [ExampleSection] = [
    ExampleSection(title: "Controls", examples: [
        SwiftExample(title: "Switch", storyboard: "controls", identifier: "SwitchViewController"),
        SwiftExample(title: "Image", storyboard: "controls", identifier: "ImageViewController"),
        SwiftExample(title: "Picker", storyboard: "controls", identifier: "PickerViewController"),
        SwiftExample(title: "Date Picker", storyboard: "controls", identifier: "DatePickerViewController"),
        SwiftExample(title: "Color Picker", storyboard: "controls", identifier: "ColorPickerViewController"),
        SwiftExample(title: "Font Picker", storyboard: "controls", identifier: "FontPickerViewController")
    ]),
    ExampleSection(title: "Views", examples: [
        SwiftExample(title: "Collection", storyboard: "views", identifier: "CollectionViewController"),
        SwiftExample(title: "Spinner", storyboard: "views", identifier: "SpinnerViewController"),
        SwiftExample(title: "Tab Bar", storyboard: "views", identifier: "TabBarController")
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
