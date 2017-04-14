//
//  ViewController.swift
//  FirstApplication
//
//  Created by Varun on 13/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txt1: UITextField!
    
    @IBOutlet var lbl1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }

    @IBAction func okayBtnClicked(_ sender: UIButton) {
        
        lbl1.text = txt1.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

