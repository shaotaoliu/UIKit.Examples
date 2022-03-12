import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var buttonStart: UIButton!
    private var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myView.center = self.view.center
        myView.backgroundColor = .red
        myView.layer.cornerRadius = 50
        view.addSubview(myView)
    }
    
    @IBAction func didButtonTapped(_ sender: Any) {
        let frame = myView.frame
        
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            self.myView.center = self.view.center
            self.myView.layer.cornerRadius = 150
            self.myView.layer.opacity = 0

        }, completion: { done in
            if done {
                self.myView.frame = frame
                self.myView.center = self.view.center
                self.myView.layer.cornerRadius = 50
                self.myView.layer.opacity = 1
            }
        })
    }
    
}
