import Foundation

let examples: [ExampleSection] = [
    ExampleSection(title: "Controls", examples: [
        SwiftExample(title: "Button", storyboard: "controls", identifier: "ButtonViewController"),
        SwiftExample(title: "Text Field", storyboard: "controls", identifier: "TextFieldViewController"),
        SwiftExample(title: "Menu", storyboard: "controls", identifier: "MenuViewController"),
        SwiftExample(title: "Switch", storyboard: "controls", identifier: "SwitchViewController"),
        SwiftExample(title: "Image", storyboard: "controls", identifier: "ImageViewController"),
        SwiftExample(title: "Search Bar", storyboard: "controls", identifier: "SearchBarViewController"),
        SwiftExample(title: "Segment Control", storyboard: "controls", identifier: "SegmentControlViewController")
    ]),
    ExampleSection(title: "Views", examples: [
        SwiftExample(title: "Collection", storyboard: "views", identifier: "CollectionViewController"),
        SwiftExample(title: "Spinner", storyboard: "views", identifier: "SpinnerViewController"),
        SwiftExample(title: "Tab Bar", storyboard: "views", identifier: "TabBarController"),
        SwiftExample(title: "Alert", storyboard: "views", identifier: "AlertViewController"),
        SwiftExample(title: "Progress Bar", storyboard: "views", identifier: "ProgressBarViewController"),
        SwiftExample(title: "Stepper", storyboard: "views", identifier: "StepperViewController"),
        SwiftExample(title: "Slider", storyboard: "views", identifier: "SliderViewController"),
        SwiftExample(title: "Stack View", storyboard: "views", identifier: "StackViewController"),
        SwiftExample(title: "Toolbar", storyboard: "views", identifier: "ToobarViewController"),
        SwiftExample(title: "Page Control", storyboard: "views", identifier: "PageControlViewController")
    ]),
    ExampleSection(title: "Pickers", examples: [
        SwiftExample(title: "Picker", storyboard: "pickers", identifier: "PickerViewController"),
        SwiftExample(title: "Date Picker", storyboard: "pickers", identifier: "DatePickerViewController"),
        SwiftExample(title: "Color Picker", storyboard: "pickers", identifier: "ColorPickerViewController"),
        SwiftExample(title: "Font Picker", storyboard: "pickers", identifier: "FontPickerViewController"),
        SwiftExample(title: "Image Picker", storyboard: "pickers", identifier: "ImagePickerViewController")
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
