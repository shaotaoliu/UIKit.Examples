import Foundation

let examples: [ExampleSection] = [
    ExampleSection(title: "Controls", examples: [
        SwiftExample(title: "Button", storyboard: "controls", identifier: "ButtonViewController"),
        SwiftExample(title: "Text Field", storyboard: "controls", identifier: "TextFieldViewController"),
        SwiftExample(title: "Menu", storyboard: "controls", identifier: "MenuViewController"),
        SwiftExample(title: "Switch", storyboard: "controls", identifier: "SwitchViewController"),
        SwiftExample(title: "Image", storyboard: "controls", identifier: "ImageViewController"),
        SwiftExample(title: "Search Bar", storyboard: "controls", identifier: "SearchBarViewController"),
        SwiftExample(title: "Segment Control", storyboard: "controls", identifier: "SegmentControlViewController"),
        SwiftExample(title: "Spinner", storyboard: "controls", identifier: "SpinnerViewController"),
        SwiftExample(title: "Progress Bar", storyboard: "controls", identifier: "ProgressBarViewController"),
        SwiftExample(title: "Stepper", storyboard: "controls", identifier: "StepperViewController"),
        SwiftExample(title: "Slider", storyboard: "controls", identifier: "SliderViewController"),
        SwiftExample(title: "MapView", storyboard: "controls", identifier: "MapViewController"),
        SwiftExample(title: "WebView", storyboard: "controls", identifier: "WebViewController")
    ]),
    ExampleSection(title: "Views", examples: [
        SwiftExample(title: "Collection", storyboard: "views", identifier: "CollectionViewController"),
        SwiftExample(title: "Collection2", storyboard: "views", identifier: "Collection2ViewController"),
        SwiftExample(title: "Tab Bar", storyboard: "views", identifier: "TabBarController"),
        SwiftExample(title: "Alert", storyboard: "views", identifier: "AlertViewController"),
        SwiftExample(title: "Stack View", storyboard: "views", identifier: "StackViewController"),
        SwiftExample(title: "Toolbar", storyboard: "views", identifier: "ToobarViewController"),
        SwiftExample(title: "Page Control", storyboard: "views", identifier: "PageControlViewController"),
        SwiftExample(title: "Table View", storyboard: "views", identifier: "TableViewController"),
        SwiftExample(title: "Animation", storyboard: "views", identifier: "AnimationViewController"),
        SwiftExample(title: "Page View", storyboard: "views", identifier: "PageExampleViewController"),
        SwiftExample(title: "Scroll View", storyboard: "views", identifier: "ScrollExampleViewController")
    ]),
    ExampleSection(title: "Pickers", examples: [
        SwiftExample(title: "Picker", storyboard: "pickers", identifier: "PickerViewController"),
        SwiftExample(title: "Date Picker", storyboard: "pickers", identifier: "DatePickerViewController"),
        SwiftExample(title: "Color Picker", storyboard: "pickers", identifier: "ColorPickerViewController"),
        SwiftExample(title: "Font Picker", storyboard: "pickers", identifier: "FontPickerViewController"),
        SwiftExample(title: "Image Picker", storyboard: "pickers", identifier: "ImagePickerViewController")
    ]),
    ExampleSection(title: "Others", examples: [
        SwiftExample(title: "Gesture", storyboard: "others", identifier: "GestureViewController"),
        SwiftExample(title: "Container", storyboard: "others", identifier: "ContainerViewController"),
        SwiftExample(title: "Keyboard", storyboard: "others", identifier: "KeyboardViewController"),
        SwiftExample(title: "Keyboard 2", storyboard: "others", identifier: "Keyboard2ViewController"),
        SwiftExample(title: "Constraints", storyboard: "others", identifier: "ConstraintsViewController"),
        SwiftExample(title: "Blur Effect", storyboard: "others", identifier: "BlurViewController"),
        SwiftExample(title: "Notification", storyboard: "others", identifier: "NotificationViewController"),
        SwiftExample(title: "Tuple", storyboard: "others", identifier: "TupleTableViewController"),
        SwiftExample(title: "Music", storyboard: "others", identifier: "MusicViewController")
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
