import UIKit

class KeyboardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var showingKeyboard = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "img1")
        userTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillShow(_:)),
          name: UIResponder.keyboardWillShowNotification,
          object: nil)
        
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillHide(_:)),
          name: UIResponder.keyboardWillHideNotification,
          object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if !showingKeyboard {
            adjustKeyboard(true, notification)
            showingKeyboard = true
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if showingKeyboard {
            adjustKeyboard(false, notification)
            showingKeyboard = false
        }
    }

    private func adjustKeyboard(_ show: Bool, _ notification: Notification) {
        guard let info = notification.userInfo,
              let frame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let offset = (frame.cgRectValue.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += offset
        scrollView.verticalScrollIndicatorInsets.bottom += offset
    }
}
