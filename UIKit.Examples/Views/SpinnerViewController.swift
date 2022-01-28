import UIKit

class SpinnerViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var buttonRun: UIButton!
    @IBOutlet weak var buttonStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.hidesWhenStopped = true
    }
    
    @IBAction func run(_ sender: Any) {
        spinner.startAnimating()
    }
    
    @IBAction func stop(_ sender: Any) {
        spinner.stopAnimating()
    }
}
