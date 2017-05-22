//
//  ViewController.swift
//  UserDefaultsDatabase
//
//  Created by Varun on 11/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblName : UILabel?
    @IBOutlet var lblRno : UILabel?
    @IBOutlet var lblClass : UILabel?
    @IBOutlet var lblCity : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblName?.text = UserDefaults.standard.value(forKey: "Name") as! String?
        lblRno?.text = UserDefaults.standard.value(forKey: "rno") as! String?
        lblClass?.text = UserDefaults.standard.value(forKey: "Class") as! String?
        lblCity?.text = UserDefaults.standard.value(forKey: "City") as! String?
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

