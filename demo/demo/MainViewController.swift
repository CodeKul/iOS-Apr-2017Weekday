//
//  FromViewController.swift
//  demo
//
//  Created by Varun on 06/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func openMenu(_ sender: Any) {
        performSegue(withIdentifier: "openMenu", sender: nil)
    }
    
    @IBAction func edgePanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translationInView: translation, viewBounds: view.bounds, direction: .Right)
        
        MenuHelper.mapGestureStateToInteractor(
            gestureState: sender.state,
            progress: progress,
            interactor:Interactor()){
                self.performSegue(withIdentifier: "openMenu", sender: nil)
        }
    }
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destination as? MenuViewController {
            destinationViewController.transitioningDelegate = self
            //destinationViewController.interactor = (destinationViewController)
        }
    }



    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return PresentMenuAnimator()
   }
 
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        //return Interactor.hasStarted ? interactor : nil
        return Interactor()
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        //return interactor.hasStarted ? interactor : nil
        return Interactor()
    }


    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


