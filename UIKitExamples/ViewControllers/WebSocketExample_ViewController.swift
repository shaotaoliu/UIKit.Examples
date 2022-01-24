import UIKit

class WebSocketExampleViewController: UIViewController {

    @IBOutlet var butCancel: UIButton!
    private var socket: URLSessionWebSocketTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let url = URL(string: "wss://demo.piesocket.com/v3/channel_1?api_key=xxxxx")
        let socket = session.webSocketTask(with: url!)
        socket.resume()
    }
    
    @IBAction func onCloseTap() {
        self.close()
    }
}

extension WebSocketExampleViewController {

    func ping() {
        socket.sendPing { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func close() {
        socket.cancel(with: .goingAway, reason: "Demo ended".data(using: .utf8))
    }
    
    func send() {
        socket.send(.string("Hello Worldd")) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func receive() {
        socket.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    print("\(data)")
                    
                case .string(let str):
                    print(str)
                    
                @unknown default:
                    break
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            self?.receive()
        }
    }
}

extension WebSocketExampleViewController: URLSessionWebSocketDelegate {

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connected to socket.")
        
        ping()
        send()
        receive()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Closed connection to socket.")
    }
}
