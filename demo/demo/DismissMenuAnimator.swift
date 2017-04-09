
//
//  DismissMenuAnimator.swift
//  demo
//
//  Created by Varun on 06/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class DismissMenuAnimator: NSObject {

}
extension DismissMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView : UIView = transitionContext.containerView
            else {
                return
        }
        //let snapshot = containerView.viewWithTag(MenuHelper.snapshotCardinalNumber)
        let snapshot = containerView.viewWithTag(MenuHelper.snapshotNumber)
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
            animations: {snapshot?.frame = CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size)
        },
            completion: { _ in
                let didTransitionComplete = !transitionContext.transitionWasCancelled
                if didTransitionComplete {
                    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
                    snapshot?.removeFromSuperview()
                }
                transitionContext.completeTransition(didTransitionComplete)
        }
        )
    }
}
