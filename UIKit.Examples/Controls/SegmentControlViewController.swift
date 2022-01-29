import UIKit

class SegmentControlViewController: UIViewController {

    @IBOutlet weak var segment1: UISegmentedControl!
    @IBOutlet weak var segment2: UISegmentedControl!
    @IBOutlet weak var segment3: UISegmentedControl!
    @IBOutlet weak var segment4: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment2.addTarget(self, action: #selector(segment2Changed), for: .valueChanged)
                
        segment2Changed()
    }

    @IBAction func segment1Changed(_ sender: Any) {
        segment4.selectedSegmentIndex = segment1.selectedSegmentIndex
    }
    
    @objc func segment2Changed() {
        for i in 0..<segment3.numberOfSegments {
            segment3.selectedSegmentIndex = (segment2.selectedSegmentIndex + 1) % segment3.numberOfSegments
            segment3.setEnabled(i != segment2.selectedSegmentIndex, forSegmentAt: i)
        }
    }
}
