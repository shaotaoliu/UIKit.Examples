import UIKit

class ConstraintsViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Constraint Example"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .systemTeal
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let buttonLogin: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let noteTextView: UITextView = {
        let attr = NSMutableAttributedString(
            string: "This is an example of ",
            attributes: [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18) ])
        
        attr.append(NSAttributedString(
            string: "Swift Constraint.",
            attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]))
        
        attr.append(NSAttributedString(
            string: " If you have any questions, please email to ",
            attributes: [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18) ]))
        
        attr.append(NSAttributedString(
            string: "hello@example.com",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.systemBlue
            ]))
        
        let textView = UITextView()
        textView.attributedText = attr
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addArrangedSubview(usernameField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(buttonLogin)
        stackView.addArrangedSubview(noteTextView)

        view.addSubview(titleLabel)
        view.addSubview(logoImage)
        view.addSubview(stackView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(gesture)
        
        buttonLogin.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        addConstraints()
    }
    
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("Logged in")
        view.endEditing(true)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            logoImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
}
