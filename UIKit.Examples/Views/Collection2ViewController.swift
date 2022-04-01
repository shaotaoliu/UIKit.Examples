import UIKit

class Collection2ViewController: UICollectionViewController {
    
    var images = Global.main.images(count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection2ViewCell", for: indexPath) as! Collection2ViewCell
        cell.setImage(image: images[indexPath.item])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let image = images.remove(at: sourceIndexPath.item)
        images.insert(image, at: destinationIndexPath.item)
    }
}
