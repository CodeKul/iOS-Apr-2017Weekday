//
//  thirdViewController.swift
//  menuBar
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftToRight(sender:)))
        gestureRecognizer.direction = .left
        self.view.addGestureRecognizer(gestureRecognizer)
        
        
        
        let gestureRecognizerRTL = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftToRight(sender:)))
        gestureRecognizerRTL.direction = .right
        self.view.addGestureRecognizer(gestureRecognizerRTL)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func swipeLeftToRight(sender: UISwipeGestureRecognizer) {
        if sender.direction.rawValue == 2 {
            performSegue(withIdentifier: "goLeft", sender: nil)
        }
        else {
            print(sender.direction.rawValue)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
