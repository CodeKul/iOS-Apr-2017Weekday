//
//  ViewController.swift
//  AutoLayout3
//
//  Created by Varun on 08/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet var leftMenuConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnMenu(_ sender: UIButton) {
        if leftMenuConstraint.constant == -200 {
            leftMenuConstraint.constant = 0
        }
        else
        {
            leftMenuConstraint.constant = -200
        }
        
        UIView.animate(withDuration: 1){
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

