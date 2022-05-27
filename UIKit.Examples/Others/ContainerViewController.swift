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

        addChildController(firstVC)
        addChildController(secondVC)
        
        secondVC.view.isHidden = true
        
//        addChildController(firstVC)
//        removeChildController(secondVC)
    }
    
    @objc func segmentChanged() {
        firstVC.view.isHidden = segment.selectedSegmentIndex != 0
        secondVC.view.isHidden = segment.selectedSegmentIndex == 0
    }
    
    private func addChildController(_ controller: UIViewController) {
        addChild(controller)
        controller.view.frame = container.bounds
        container.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
//    @objc func segmentChanged() {
//        if segment.selectedSegmentIndex == 0 {
//            addChildController(firstVC)
//            removeChildController(secondVC)
//        }
//        else {
//            removeChildController(firstVC)
//            addChildController(secondVC)
//        }
//    }
//
//    private func removeChildController(_ controller: UIViewController) {
//        controller.willMove(toParent: nil)
//        controller.view.removeFromSuperview()
//        controller.removeFromParent()
//    }
    
}
