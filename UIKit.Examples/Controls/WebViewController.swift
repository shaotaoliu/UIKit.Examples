import UIKit
import WebKit
import SafariServices

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var permissionOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        loadWebPage()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refresh))
    }

    private func loadWebPage() {
//        let url = "http://www.apple.com"
//        let request = URLRequest(url: URL(string: url)!)
//
//        webView.load(request)
        
        webView.load("http://www.apple.com")
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func refresh() {
        loadWebPage()
    }
    
    // load page from local:
    @IBAction func goHome(_ sender: Any) {
        if let url = Bundle.main.url(forResource: "myHomePage", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
    
    @IBAction func goGoogle(_ sender: Any) {
        webView.load("http://www.google.com")
    }
    
    @IBAction func runJavaScript(_ sender: Any) {
        if title == "Hello" {
            webView.evaluateJavaScript("document.getElementById('input1').value = 'Hello!'")
        }
    }
    
    @IBAction func openSafari(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://www.microsoft.com")!)
        present(vc, animated: true)
    }
    
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if !permissionOn.isOn {
            decisionHandler(.allow)
            return
        }
        
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        // allow:
        if url.host == "www.apple.com" {
            decisionHandler(.allow)
            return
        }
        
        // reject and open in web brower:
        UIApplication.shared.open(url)
        decisionHandler(.cancel)
    }
}

extension WebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
        
        completionHandler()
    }
}

extension WebViewController {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "estimatedProgress":
            print(Float(webView.estimatedProgress))
            
        case "title":
            title = webView.title ?? ""
            
        default:
            break
        }
    }
}

extension WKWebView {
    
    func load(_ urlString: String) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        load(request)
    }
}
