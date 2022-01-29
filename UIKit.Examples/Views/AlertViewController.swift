import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var buttonOK: UIButton!
    @IBOutlet weak var buttonOKCancel: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonInput: UIButton!
    
    private var preferredStyle: UIAlertController.Style {
        return segment.selectedSegmentIndex == 0 ? .alert : .actionSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickOK(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "Just say hello", preferredStyle: preferredStyle)
        
        let actionOK = UIAlertAction(title: "OK", style: .cancel) { _ in
            print("OK")
        }
        
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
    
    @IBAction func clickOKCancel(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "Just say hello", preferredStyle: preferredStyle)
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK")
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    
    @IBAction func clickThreeButtons(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "Just say hello", preferredStyle: preferredStyle)
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK")
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
        let actionSave = UIAlertAction(title: "Save", style: .destructive) { _ in
            print("Save")
        }
        
        alert.addAction(actionSave)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    
    @IBAction func clickInputButton(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "Just say hello", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter Name ..."
        }
        
        let actionOK = UIAlertAction(title: "OK", style: .cancel) { _ in
            let name = alert.textFields?.first?.text ?? ""
            print(name)
        }
        
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
    
}
