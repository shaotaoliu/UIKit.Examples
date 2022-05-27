import UIKit

class TransformViewController: UIViewController {

    private var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        myView.backgroundColor = .systemBlue
        myView.center = view.center
        view.addSubview(myView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        myView.addGestureRecognizer(gesture)
    }

    @objc func viewTapped() {
        
        UIView.animate(withDuration: 1, animations: {
            self.myView.transform = CGAffineTransform(rotationAngle: .pi)
                .concatenating(CGAffineTransform(translationX: 0, y: -200))
                .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
        }, completion: { done in
            UIView.animate(withDuration: 1) {
                self.myView.transform = .identity
            }
        })
    }
}
