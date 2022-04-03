import UIKit

class Collection2ViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
}
