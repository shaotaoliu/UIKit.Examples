import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let vm = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        vm.loadNext()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "Item \(vm.items[indexPath.row])"
        cell.contentConfiguration = config
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if vm.items.count >= 100 {
            return
        }
        
        if reachedBottom(scrollView) {
            vm.loadNext()
            tableView.reloadData()
        }
    }
    
    func reachedBottom(_ scrollView: UIScrollView) -> Bool {
        // the height of the view in the screen
        let height = scrollView.frame.size.height
        
        // the distance from the top of the scroll view to current top of the screen
        let offset = scrollView.contentOffset.y
        
        // the height of the scroll view
        let scrollViewHeight = scrollView.contentSize.height
        
        return offset + height >= scrollViewHeight
    }
}
