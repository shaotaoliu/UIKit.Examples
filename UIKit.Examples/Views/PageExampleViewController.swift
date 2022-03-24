import UIKit

class PageExampleViewController: UIPageViewController {

    private var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .systemGreen
        
        dataSource = self
        populateControllers()
        
        if let firstVC = controllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func populateControllers() {
        [
            "AlertViewController",
            "StackViewController",
            "AnimationViewController",
            "CollectionViewController",
            "ToobarViewController"
        ].forEach { id in
            if let vc = storyboard?.instantiateViewController(withIdentifier: id) {
                controllers.append(vc)
            }
        }
    }

}

extension PageExampleViewController: UIPageViewControllerDataSource {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let firstVC = viewControllers?.first
        return controllers.firstIndex(of: firstVC!) ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController)!
        let prev = index == 0 ? controllers.count - 1 : index - 1
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController)!
        let next = (index == controllers.count - 1) ? 0 : index + 1
        return controllers[next]
    }
}
