import UIKit

class StepperViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        valueLabel.text = String(Int(stepper.value))
    }
    
}
