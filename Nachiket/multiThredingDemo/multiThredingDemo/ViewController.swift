//
//  ViewController.swift
//  multiThredingDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showClicked(_ sender: UIButton) {
        let imgVC = storyboard?.instantiateViewController(withIdentifier: "imageViewController")
        self.present(imgVC!, animated: true, completion: nil)
    }

}

