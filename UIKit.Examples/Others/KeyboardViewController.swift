import UIKit

class KeyboardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var isShowingKeybord = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        nicknameField.delegate = self
        usernameField.delegate = self
        passwordField.delegate = self
        
        usernameField.tag = 20
        passwordField.tag = 20
        
        addBarButtons()
        
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
    
    func addBarButtons() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let itemDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(endEditing))
        let itemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let itemClose = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(endEditing))

        toolBar.setItems([itemDone, itemSpace, itemClose], animated: false)
        
        emailField.inputAccessoryView = toolBar
        nicknameField.inputAccessoryView = toolBar
        usernameField.inputAccessoryView = toolBar
        passwordField.inputAccessoryView = toolBar
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if isShowingKeybord {
            if let info = notification.userInfo, let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = value.cgRectValue.height
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        if isShowingKeybord {
            if let info = notification.userInfo, let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = value.cgRectValue.height
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyboardHeight, right: 0)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 20 {
            isShowingKeybord = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 20 {
            isShowingKeybord = false
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

/*

 How to add a scroll view in storyboard?
 1. Add a UIScrollView to the view controller.
 2. Set the auto layout of the scroll view to 0 for top, leading, trailing, and bottom.
 3. Add a UIView to the scroll view and rename it to content view.
 4. Set the auto layout of the content view to 0 for top, leading, trailing, and bottom to the scroll view (important!).
 5. Set equal width from the content view to the scroll view.
 6. Set the height of the content view to a constant, such as 1000.

 */
