import UIKit

class SwitchViewController: UIViewController {

    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var rectangle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didSwitchChange(_ sender: Any) {
        if switchControl.isOn {
            rectangle.backgroundColor = .systemGreen
        }
        else {
            rectangle.backgroundColor = .systemRed
        }
    }
    
}
