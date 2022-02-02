import UIKit

class TransitioningController: NSObject {
}

extension TransitioningController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DismissTransitionController(dismissedViewController: dismissed)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        PresentTransitionController(presentingViewController: presenting, presentedViewController: presented)
    }
}
