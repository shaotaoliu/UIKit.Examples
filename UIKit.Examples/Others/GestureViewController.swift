import UIKit

class GestureViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedMiddleView(_:)))
        middleView.addGestureRecognizer(tapGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedBottomView))
        swipeGesture.direction = .down
        bottomView.addGestureRecognizer(swipeGesture)
    }

    @IBAction func tappedTopView(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.topView.backgroundColor = .red
        }
    }
    
    @objc func tappedMiddleView(_ gesture: UITapGestureRecognizer) {
        if let vm = gesture.view {
            vm.backgroundColor = .red
        }
    }
    
    @objc func swipedBottomView() {
        bottomView.backgroundColor = .red
    }
}
