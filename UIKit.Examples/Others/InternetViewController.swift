import UIKit
import Network

class InternetViewController: UIViewController {

    @IBOutlet weak var labelConnectionType: UILabel!
    @IBOutlet weak var labelConnectionStatus: UILabel!
    private let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startMonitoring()
    }
    
    private func startMonitoring() {

        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    let connectionType = self.getConnectionType(path: path)
                    
                    self.labelConnectionStatus.text = "Connection Status: connected"
                    self.labelConnectionType.text = "Connection Type: \(connectionType)"
                }
                else {
                    self.labelConnectionStatus.text = "Connection Status: disconnected"
                    self.labelConnectionType.text = "Connection Type: N/A"
                }
            }
        }
        
        monitor.start(queue: DispatchQueue.global())
    }
    
    private func getConnectionType(path: NWPath) -> NWInterface.InterfaceType {
        if path.usesInterfaceType(.wifi) {
            return .wifi
        }
        else if path.usesInterfaceType(.cellular) {
            return .cellular
        }
        else if path.usesInterfaceType(.wiredEthernet) {
            return .wiredEthernet
        }
        
        return .other
    }

    deinit {
        monitor.cancel()
    }
}
