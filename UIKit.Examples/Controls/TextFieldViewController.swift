import UIKit

class TextFieldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var resultLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.delegate = self
        passwordLabel.delegate = self
        
        usernameLabel.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resultLabel.text = textField.text
        return true
    }
}
