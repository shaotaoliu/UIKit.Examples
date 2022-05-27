import UIKit

class RingViewController: UIViewController {

    let shape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create a path:
        
        let circlePath = UIBezierPath(
            arcCenter: view.center,
            radius: 120,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true)
        
        // create a track:
        
        let track = CAShapeLayer()
        
        track.path = circlePath.cgPath
        track.lineWidth = 20
        track.strokeColor = UIColor.lightGray.cgColor
        track.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(track)
        
        // create the ring:
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 20
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
    
}
