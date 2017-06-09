//
//  secondViewController.swift
//  menuBar
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureReecogniser = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(backToMainView(swipe:)))
        gestureReecogniser.edges = .left
       self.view.addGestureRecognizer(gestureReecogniser)
        	
      
       let gestureReecogniserRTL = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(backToMainView(swipe:)))
        gestureReecogniserRTL.edges = .right
        self.view.addGestureRecognizer(gestureReecogniserRTL)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func backToMainView(swipe: UIScreenEdgePanGestureRecognizer) {
        
        if swipe.edges == .right && swipe.state == .began {
            print ("in right")
            performSegue(withIdentifier: "goRight", sender: nil)
        }
        else if swipe.edges == .left{
            _ = navigationController?.popViewController(animated: true)
        }
        
        
    }

}
