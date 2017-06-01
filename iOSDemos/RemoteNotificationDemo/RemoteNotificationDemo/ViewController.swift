//
//  ViewController.swift
//  RemoteNotificationDemo
//
//  Created by Varun on 01/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var lbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func setLabel(_ text : String) {
        
        lbl.text = text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

