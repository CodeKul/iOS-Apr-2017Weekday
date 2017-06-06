//
//  ViewController.swift
//  MultiThreading
//
//  Created by Varun on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnShowImage(_ sender: Any) {
       let imageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewController")
        self.present(imageVC, animated: true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

