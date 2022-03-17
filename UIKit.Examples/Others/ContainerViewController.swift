import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    private var segment = UISegmentedControl(items: ["First", "Second"])
    private let firstVC = FirstViewController()
    private let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = segment
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        container.addSubview(firstVC.view)
        container.addSubview(secondVC.view)

        firstVC.view.frame = container.bounds
        secondVC.view.frame = container.bounds
        secondVC.view.isHidden = true
    }
    
    @objc func segmentChanged() {
        firstVC.view.isHidden = segment.selectedSegmentIndex != 0
        secondVC.view.isHidden = segment.selectedSegmentIndex == 0
    }
}
