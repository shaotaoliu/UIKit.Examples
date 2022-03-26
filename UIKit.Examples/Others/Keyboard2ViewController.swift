import UIKit

class Keyboard2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.delegate = self
        passwordField.delegate = self
        
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
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let textField = currentTextField, view.frame.origin.y == 0 {
            if let info = notification.userInfo, let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = value.cgRectValue.height
                let bottomSpace = view.frame.height - textField.frame.minY - textField.frame.height
                view.frame.origin.y -= keyboardHeight - bottomSpace + 20
            }
        }
        
        currentTextField = nil
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
