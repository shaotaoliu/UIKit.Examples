import UIKit

class ColorPickerViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    @IBOutlet weak var colorButton: UIButton!
    private var colorPicker = UIColorPickerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = colorButton.backgroundColor ?? .systemRed
        colorPicker.delegate = self
    }
    
    @IBAction func showColorPicker(_ sender: Any) {
        colorPicker.modalPresentationStyle = .popover
        present(colorPicker, animated: true)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        colorButton.backgroundColor = viewController.selectedColor
        
        if !continuously {
            viewController.dismiss(animated: true)
        }
    }
}
