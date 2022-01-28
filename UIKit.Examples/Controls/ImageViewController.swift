import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    private let count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.animationImages = (1...count).map { UIImage(named: "img\($0)")! }
        imageView.contentMode = .scaleAspectFit
        imageView.animationDuration = Double(count)
        imageView.startAnimating()
    }
    
}
