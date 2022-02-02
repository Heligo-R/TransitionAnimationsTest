import UIKit

class PresentTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    private var animator: UIViewImplicitlyAnimating?
    
    let presentingViewController: UIViewController
    let presentedViewController: UIViewController
    let animationDuration: TimeInterval
    
    init(presentingViewController: UIViewController, presentedViewController: UIViewController, animationDuration: TimeInterval = 0.3) {
        self.presentingViewController = presentingViewController
        self.presentedViewController = presentedViewController
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
        
        let presentedView = presentedViewController.view ?? UIView()
        let initialFrame = transitionContext.initialFrame(for: presentingViewController)
        
        var presentingViewFrame = initialFrame
        presentingViewFrame.origin.x = -presentedView.frame.size.width
        
        presentedView.frame = presentingViewFrame
        transitionContext.containerView.addSubview(presentedView)
        
        let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), curve: .easeInOut) {
            presentedView.frame = initialFrame
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
