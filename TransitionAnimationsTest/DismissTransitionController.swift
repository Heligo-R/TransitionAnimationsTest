import UIKit

class DismissTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    private var animator: UIViewImplicitlyAnimating?
    
    let dismissedViewController: UIViewController
    let animationDuration: TimeInterval
    
    init(dismissedViewController: UIViewController, animationDuration: TimeInterval = 0.3) {
        self.dismissedViewController = dismissedViewController
        self.animationDuration = animationDuration
        
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.interruptibleAnimator(using: transitionContext)
        animator.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        if let animator = animator {
            return animator
        }
        
        let presentingView = transitionContext.viewController(forKey: .to)?.view
        var initialFrame = transitionContext.initialFrame(for: dismissedViewController)
        
        presentingView?.frame = initialFrame
        
        initialFrame.origin.x = -initialFrame.width
        
        let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), curve: .easeInOut) { [weak self] in
            self?.dismissedViewController.view?.frame = initialFrame
        }
        
        animator.addCompletion { _ in
            transitionContext.completeTransition(true)
        }
        
        self.animator = animator
        
        return animator
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        animator = nil
    }
}
