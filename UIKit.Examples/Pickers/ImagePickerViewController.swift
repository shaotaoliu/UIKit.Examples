import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    private var picker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = UIImagePickerController()
        picker.delegate = self
        
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20

    }
    
    @IBAction func chooseButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Choose an image", message: "Please choose an image", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true)
        })
        
        present(alert, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
