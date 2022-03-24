import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    private var segment = UISegmentedControl(items: ["First", "Second"])
    private let firstVC = FirstViewController()
    private let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        navigationItem.titleView = segment

        firstVC.view.frame = container.bounds
        secondVC.view.frame = container.bounds
        
        addChild(firstVC)
        addChild(secondVC)
        
        container.addSubview(firstVC.view)
        container.addSubview(secondVC.view)

        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)
        
        secondVC.view.isHidden = true
    }
    
    @objc func segmentChanged() {
        firstVC.view.isHidden = segment.selectedSegmentIndex != 0
        secondVC.view.isHidden = segment.selectedSegmentIndex == 0
    }
}
