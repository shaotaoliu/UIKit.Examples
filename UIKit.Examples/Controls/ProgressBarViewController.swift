import UIKit

class ProgressBarViewController: UIViewController {

    @IBOutlet weak var progressBar1: UIProgressView!
    @IBOutlet weak var progressBar2: UIProgressView!
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.progressBar1.setProgress(self.progressBar1.progress == 1 ? 0.1 : self.progressBar1.progress + 0.1, animated: false)
            self.progressBar2.progress = self.progressBar2.progress == 1 ? 0.05 : self.progressBar2.progress + 0.05
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
}
