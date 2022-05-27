import UIKit

class ActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stringButtonTapped(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [
            "How are you doing?"
        ], applicationActivities: nil)
        
        present(controller, animated: true)
    }
    
    @IBAction func imageButtonTapped(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [
            "How are you doing?",
            UIImage(named: "image1")!
        ], applicationActivities: nil)
        
        present(controller, animated: true)
    }
    
    @IBAction func urlButtonTapped(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [
            "How are you doing?",
            UIImage(named: "image1")!,
            URL(string: "https://www.microsoft.com")!
        ], applicationActivities: nil)
        
        present(controller, animated: true)
    }
    
}
