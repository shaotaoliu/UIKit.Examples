import Foundation

let examples: [ExampleSection] = [
    ExampleSection(title: "Controls", examples: [
        SwiftExample(title: "Switch", storyboard: "controls", identifier: "SwitchViewController"),
        SwiftExample(title: "Image", storyboard: "controls", identifier: "ImageViewController"),
    ]),
    ExampleSection(title: "Views", examples: [
        SwiftExample(title: "Collection", storyboard: "views", identifier: "CollectionViewController"),
        SwiftExample(title: "Spinner", storyboard: "views", identifier: "SpinnerViewController"),
        SwiftExample(title: "Tab Bar", storyboard: "views", identifier: "TabBarController")
    ]),
    ExampleSection(title: "Pickers", examples: [
        SwiftExample(title: "Picker", storyboard: "pickers", identifier: "PickerViewController"),
        SwiftExample(title: "Date Picker", storyboard: "pickers", identifier: "DatePickerViewController"),
        SwiftExample(title: "Color Picker", storyboard: "pickers", identifier: "ColorPickerViewController"),
        SwiftExample(title: "Font Picker", storyboard: "pickers", identifier: "FontPickerViewController")
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
