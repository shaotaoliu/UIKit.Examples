import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelResult.text = String(count)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        count += 1
        labelResult.text = String(count)
    }
}
