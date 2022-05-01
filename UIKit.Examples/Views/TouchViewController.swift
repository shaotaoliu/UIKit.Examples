import UIKit

class TouchViewController: UIViewController {

    @IBOutlet weak var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        square.isUserInteractionEnabled = true
    }
    
    private var isDragging = false
    private var startOrigin: CGPoint = .zero
    private var startLocation: CGPoint = .zero
    
}

extension TouchViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: square)
        
        if square.bounds.contains(location) {
            isDragging = true
            
            startOrigin = square.frame.origin
            startLocation = touch.location(in: view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDragging {
            return
        }
        
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: view)
        
        square.frame.origin = CGPoint(
            x: startOrigin.x + location.x - startLocation.x,
            y: startOrigin.y + location.y - startLocation.y
        )
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragging = false
    }
}
