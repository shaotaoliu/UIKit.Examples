import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var fileButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fileButton.showsMenuAsPrimaryAction = true
        fileButton.menu = UIMenu(children: [
            UIAction(title: "Open") { _ in
                self.resultLabel.text = "Open"
            },
            UIAction(title: "Close") { _ in
                self.resultLabel.text = "Close"
            }
        ])
        
        editButton.showsMenuAsPrimaryAction = true
        editButton.menu = UIMenu(children: [
            UIAction(title: "Cut", image: UIImage(systemName: "scissors")) { _ in
                self.resultLabel.text = "Cut"
            },
            UIAction(title: "Delete", image: UIImage(systemName: "trash")) { _ in
                self.resultLabel.text = "Delete"
            }
        ])
        
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = UIMenu(children: [
            UIAction(title: "France") { _ in
                self.resultLabel.text = "France"
            },
            UIAction(title: "Japan") { _ in
                self.resultLabel.text = "Japan"
            },
            UIMenu(title: "United States", options: .singleSelection, children: [
                UIAction(title: "New York", state: .on) { _ in
                    self.resultLabel.text = "New York"
                },
                UIAction(title: "Los Angeles") { _ in
                    self.resultLabel.text = "Los Angeles"
                },
                UIAction(title: "Las Vegas") { _ in
                    self.resultLabel.text = "Las Vegas"
                }
            ])
        ])
        
        checkButton.showsMenuAsPrimaryAction = true
        checkButton.changesSelectionAsPrimaryAction = true
        
        checkButton.menu = UIMenu(children: [
            UIAction(title: "Red") { _ in
                self.resultLabel.textColor = .systemRed
            },
            UIAction(title: "Green") { _ in
                self.resultLabel.textColor = .systemGreen
            },
            UIAction(title: "Blue", state: .on) { _ in
                self.resultLabel.textColor = .systemBlue
            }
        ])
        
        resultLabel.textColor = .systemBlue
    }
    

}
