import UIKit

class GradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [ UIColor.systemPink.cgColor, UIColor.systemBlue.cgColor ]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        // add a custom button:
        
        let button = MyButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        button.center = view.center
        button.setTitle("My Button", for: .normal)
        
        view.addSubview(button)
    }
    
    class MyButton: UIButton {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [ UIColor.systemYellow.cgColor, UIColor.systemGreen.cgColor ]
            gradient.cornerRadius = 5
            layer.addSublayer(gradient)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}
