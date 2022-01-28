import UIKit

class FontPickerViewController: UIViewController, UIFontPickerViewControllerDelegate {

    private var fontPicker: UIFontPickerViewController!
    @IBOutlet weak var fontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = true
        config.displayUsingSystemFont = false
        config.filteredTraits = [.classModernSerifs]
        
        fontPicker = UIFontPickerViewController(configuration: config)
        fontPicker.modalPresentationStyle = .popover
        fontPicker.delegate = self
    }
    
    @IBAction func showFontPicker(_ sender: Any) {
        present(fontPicker, animated: true)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else {
            return
        }
        
        fontLabel.font = UIFont(descriptor: descriptor, size: 24)
        viewController.dismiss(animated: true)
    }
}
