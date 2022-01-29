import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIKit Examples"
        table.delegate = self
        table.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples[section].examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = examples[indexPath.section].examples[indexPath.row].title
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let example = examples[indexPath.section].examples[indexPath.row]
        let sb = UIStoryboard(name: example.storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: example.identifier)
        vc.title = example.title
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return examples[section].title
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var content = UIListContentConfiguration.groupedHeader()
        content.text = examples[section].title
        content.textProperties.alignment = .natural
        
        let header = UITableViewHeaderFooterView()
        header.contentConfiguration = content
        return header
    }
}
