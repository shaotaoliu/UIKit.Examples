import UIKit

class Constraints2ViewController: UIViewController {

    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            labelUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            labelUsername.bottomAnchor.constraint(equalTo: labelPassword.topAnchor, constant: -20),
            
            labelPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            labelPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            labelPassword.bottomAnchor.constraint(equalTo: buttonSubmit.topAnchor, constant: -20),
            
            buttonSubmit.widthAnchor.constraint(equalToConstant: 150),
            buttonSubmit.heightAnchor.constraint(equalToConstant: 35),
            buttonSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSubmit.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20)
        ])
    }

    @IBAction func submitTapped(_ sender: Any) {
        labelUsername.resignFirstResponder()
        labelPassword.resignFirstResponder()
    }
}
