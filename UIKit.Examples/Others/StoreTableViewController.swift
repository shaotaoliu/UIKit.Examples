import UIKit
import StoreKit

class StoreTableViewController: UITableViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    // Create a StoreKit Configuration file and add three Add Non-Consumable In-App Purchase items
    // Add the StoreKit Configuration file to the run scheme (Options tab)
    
    private let productNames = ["com.cicimaya.apple", "com.cicimaya.iphone", "com.cicimaya.candy"]
    private var products = [SKProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SKPaymentQueue.default().add(self)
        fetchProducts()
    }
    
    private func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: Set(productNames))
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = "\(product.localizedTitle) - \(product.priceLocale.currencySymbol ?? "$")\(product.price)"
        cell.detailTextLabel?.text = product.localizedDescription
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        // purchase
        let product = products[indexPath.row]
        let payment = SKPayment(product: product)
        
        SKPaymentQueue.default().add(payment)
    }

    // payment:
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        transactions.forEach({
            switch $0.transactionState {
            case .purchasing:
                print("purchasing...")
                
            case .purchased:
                print("purchased!")
                
            case .failed:
                print("gave up")
                
            default:
                break
            }
        })
    }
    
    // To repurchase the products, go to menu Debug -> StoreKit -> Manage Transactions... delete the transactinos.
}
