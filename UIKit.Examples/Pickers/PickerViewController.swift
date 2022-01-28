import UIKit

class PickerViewController: UIViewController {

    @IBOutlet weak var rectangle: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    private let values = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 255]
    private var redValue: Int = 0 {
        didSet {
            updateRectangleBackground()
        }
    }
    
    private var greenValue: Int = 0 {
        didSet {
            updateRectangleBackground()
        }
    }
    
    private var blueValue: Int = 0 {
        didSet {
            updateRectangleBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        // calling the selectRow method does not trigger the delete method automatically
        // need to fire off the delegate method manually.
        picker.selectRow(values.count - 1, inComponent: 0, animated: false)
        pickerView(picker, didSelectRow: values.count - 1, inComponent: 0)
    }
    
    private func updateRectangleBackground() {
        rectangle.backgroundColor = UIColor(red: CGFloat(redValue) / 255,
                                            green: CGFloat(greenValue) / 255,
                                            blue: CGFloat(blueValue) / 255,
                                            alpha: 1)
    }
}

extension PickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}

extension PickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(values[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            redValue = values[row]
        case 1:
            greenValue = values[row]
        case 2:
            blueValue = values[row]
        default:
            fatalError("Something is wrong!")
        }
    }
}
