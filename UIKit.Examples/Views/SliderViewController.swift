import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider1ValueChanged(slider1!)
        slider2ValueChanged(slider2!)
    }
    
    @IBAction func slider1ValueChanged(_ sender: Any) {
        valueLabel.text = String(Int(slider1.value))
    }
    
    @IBAction func slider2ValueChanged(_ sender: Any) {
        valueLabel.font = valueLabel.font.withSize(CGFloat(slider2.value))
    }
}
