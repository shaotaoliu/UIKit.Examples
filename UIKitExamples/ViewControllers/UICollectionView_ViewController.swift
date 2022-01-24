import UIKit

class UICollectionViewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageNames = ["arch", "glacier", "smoky", "rainer", "tipsoo", "stone"]
    var favorites: [Int] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 4, height: view.frame.size.width / 2 - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let open = UIAction(
                title: "Open",
                image: UIImage(systemName: "link"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off) { _ in
                    print("Tapped Open")
                }
            
            let favorite = UIAction(
                title: "Favorite",
                image: UIImage(systemName: self.favorites.contains(indexPath.row) ? "star.fill" : "star"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off) { _ in
                    if self.favorites.contains(indexPath.row) {
                        self.favorites.removeAll { $0 == indexPath.row }
                    } else {
                        self.favorites.append(indexPath.row)
                    }
                }
            
            let search = UIAction(
                title: "Search",
                image: UIImage(systemName: "magnifyingglass"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off) { _ in
                    print("Tapped Search")
                }
            
            return UIMenu(title: "Actions",
                          image: nil,
                          identifier: nil,
                          options: UIMenu.Options.displayInline,
                          children: [open, favorite, search])
        }
        
        return config
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
