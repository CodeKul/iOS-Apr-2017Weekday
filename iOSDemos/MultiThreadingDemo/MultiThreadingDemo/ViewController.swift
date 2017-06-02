//
//  ViewController.swift
//  MultiThreadingDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func gotoImageVC(_ sender : UIButton) {
        
        let imgVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewController")
        
        self.present(imgVC, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

