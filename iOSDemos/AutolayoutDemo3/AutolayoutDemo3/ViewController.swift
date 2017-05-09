//
//  ViewController.swift
//  AutolayoutDemo3
//
//  Created by Abhi on 08/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftSideConstraintsForMenu : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func menuButtonClicked(_ sender : UIButton) {
        
        if leftSideConstraintsForMenu.constant == 0 {
            leftSideConstraintsForMenu.constant = -200
        }
        else {
            leftSideConstraintsForMenu.constant = 0
        }

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

