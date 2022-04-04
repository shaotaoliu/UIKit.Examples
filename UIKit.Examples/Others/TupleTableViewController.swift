import UIKit

class TupleTableViewController: UITableViewController {

    var ds: [(name: String, desc: String)] = []
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: #selector(removeItem))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    @objc func addItem() {
        ds.append((name: "Item \(index)", desc: "This is item \(index)"))
        index += 1
        
        let indexPath = IndexPath(row: ds.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @objc func removeItem() {
        ds.remove(at: ds.count - 1)
        
        let indexPath = IndexPath(row: ds.count, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ds[indexPath.row].name
        cell.detailTextLabel?.text = ds[indexPath.row].desc
        return cell
    }

}
