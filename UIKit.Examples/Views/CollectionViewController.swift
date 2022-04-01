import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var barItem: UITabBarItem!
    let images: [String] = (1...10).map { "image\($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate = self
        collection.dataSource = self
        collection.collectionViewLayout = UICollectionViewFlowLayout()
        
        barItem.badgeValue = "3"
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionExampleViewCell", for: indexPath) as! CollectionExampleViewCell
        cell.setupUI(label: images[indexPath.row], imageName: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width / 2 - 4, height: view.bounds.size.width / 2 - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

class CollectionExampleViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    func setupUI(label: String, imageName: String) {
        imageLabel.text = label
        imageView.image = UIImage(named: imageName)!
    }
}

extension CollectionViewController {
    
    // long press to activate the menu:
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let openAction = UIAction(title: "Open",
                                  image: UIImage(systemName: "link"),
                                  identifier: nil,
                                  discoverabilityTitle: nil,
                                  state: .off) { _ in
            print("Open")
        }
        
        let searchAction = UIAction(title: "Search",
                                  image: UIImage(systemName: "magnifyingglass"),
                                  identifier: nil,
                                  discoverabilityTitle: nil,
                                  state: .off) { _ in
            print("Search")
        }
        
        let menu = UIMenu(title: "Actions",
                          image: nil,
                          identifier: nil,
                          options: .displayInline,
                          children: [openAction, searchAction])
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return menu
        }
    }
}
