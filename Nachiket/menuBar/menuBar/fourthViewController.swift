//
//  fourthViewController.swift
//  menuBar
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightToLeft(sender:)))
        gestureRecognizer.direction = .right
        self.view.addGestureRecognizer(gestureRecognizer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   func swipeRightToLeft(sender: UISwipeGestureRecognizer) {
        if sender.direction.rawValue == 1 {
            _ = navigationController?.popViewController(animated: true)
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
