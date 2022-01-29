import UIKit

class PageControlViewController: UIViewController {
    
    @IBOutlet var rectangle: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let colors = [
        UIColor.systemRed,
        UIColor.systemGreen,
        UIColor.systemBlue,
        UIColor.systemYellow,
        UIColor.systemIndigo,
        UIColor.systemPurple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prevButton.isEnabled = false
        rectangle.layer.cornerRadius = 10
    }
    
    @IBAction func pageControlViewChanged(_ sender: Any) {
        refreshPage()
    }
    
    @IBAction func prevButtonClicked(_ sender: Any) {
        if pageControl.currentPage > 0 {
            pageControl.currentPage -= 1
            refreshPage()
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if pageControl.currentPage < pageControl.numberOfPages - 1 {
            pageControl.currentPage += 1
            refreshPage()
        }
    }
    
    private func refreshPage() {
        rectangle.backgroundColor = colors[pageControl.currentPage]
        prevButton.isEnabled = pageControl.currentPage > 0
        nextButton.isEnabled = pageControl.currentPage < pageControl.numberOfPages - 1
    }
}
