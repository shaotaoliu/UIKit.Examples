import UIKit

class ToobarViewController: UIViewController {

    @IBOutlet weak var listIcon: UIBarButtonItem!
    @IBOutlet weak var lableResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listIcon.menu = UIMenu(title: "", children: [
            UIAction(title: "New") { _ in
                self.lableResult.text = "New"
            },
            UIAction(title: "Open") { _ in
                self.lableResult.text = "Open"
            },
            UIAction(title: "Save") { _ in
                self.lableResult.text = "Save"
            },
            UIAction(title: "Close") { _ in
                self.lableResult.text = "Close"
            }
        ])
    }
    
    @IBAction func helloClicked(_ sender: Any) {
        self.lableResult.text = "Hello"
    }
    
    @IBAction func trashClicked(_ sender: Any) {
        self.lableResult.text = "Delete"
    }
}
