import UIKit

class TableViewExampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let names = ["Kevin", "Chris", "Jason"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // cell.textLabel?.text = names[indexPath.row]
        // cell.accessoryType = .disclosureIndicator
        
        var content = cell.defaultContentConfiguration()
        
        content.text = String(names[indexPath.row].first!)
        content.textProperties.color = .blue
        
        content.secondaryText = names[indexPath.row]
        content.secondaryTextProperties.color = .gray
        
        content.image = UIImage(systemName: "star")
        content.imageProperties.tintColor = .purple
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let label = tableView.cellForRow(at: indexPath)?.textLabel?.text
        print(label ?? "")
    }
}
