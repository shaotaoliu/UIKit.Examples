import UIKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPDF()
    }
    
    private func loadPDF() {
        if let url = Bundle.main.url(forResource: "sample", withExtension: "pdf"),
           let doc = PDFDocument(url: url) {
            pdfView.document = doc
        }
    }
}
