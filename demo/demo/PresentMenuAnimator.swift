//
//  PresentMenuAnimator.swift
//  demo
//
//  Created by Varun on 06/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class PresentMenuAnimator: NSObject {

}
extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let FromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView :UIView = transitionContext.containerView
            else {
                return
        }
        containerView.insertSubview(toVC.view, belowSubview: FromViewController.view)
        
        // replace main view with snapshot
        let snapshot = FromViewController.view.snapshotView(afterScreenUpdates: false)
        snapshot?.tag = MenuHelper.snapshotNumber
        snapshot?.isUserInteractionEnabled = false
        snapshot?.layer.shadowOpacity = 0.7
        containerView.insertSubview(snapshot!, aboveSubview: toVC.view)
        FromViewController.view.isHidden = true
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                snapshot!.center.x += UIScreen.main.bounds.width * MenuHelper.menuWidth
        },
            completion: { _ in
                FromViewController.view.isHidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
