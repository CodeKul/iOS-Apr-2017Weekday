//
//  ViewController.swift
//  menuBar
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var rightMargin: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideOptionView))
        mainView.addGestureRecognizer(gestureRecognizer)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showOptions(_ sender: Any) {
        rightMargin.constant = 0
    }
    
    
    func hideOptionView(){
        rightMargin.constant = -180
    }

}

