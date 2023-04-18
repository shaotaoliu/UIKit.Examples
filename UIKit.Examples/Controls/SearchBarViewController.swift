import UIKit

class SearchBarViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    private let cities = [
        "Irvine", "Lake Forest", "Mission viejo", "Laguna Beach", "Newport Beach",
        "Laguna Hills", "San Francisco", "San Diego", "Lake Taho", "Long Beach"]
    
    private var filterCities: [String] {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return cities
        }
        
        return cities.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        table.delegate = self
        table.dataSource = self
    }
}

extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        table.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        table.reloadData()
    }
}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = filterCities[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}
