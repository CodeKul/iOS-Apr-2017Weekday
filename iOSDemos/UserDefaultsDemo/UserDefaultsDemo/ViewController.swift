//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Abhi on 11/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let strData = UserDefaults.standard.value(forKey: "name")
        
        if (strData != nil) {
            nameLbl.text = strData as! String?
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

