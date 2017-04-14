//
//  ViewController.swift
//  FirstApp
//
//  Created by Varun on 13/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtColor: UITextField!
    
    
    @IBOutlet var viewColor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func funcChangeColor(_ sender: Any) {
        var clrName : String
        clrName = txtColor.text!
        
        switch clrName {
        case "red":
            viewColor.backgroundColor = UIColor.red
        case "blue":
             viewColor.backgroundColor = UIColor.blue
        case "green":
            viewColor.backgroundColor = UIColor.green
        case "yellow":
            viewColor.backgroundColor = UIColor.yellow
        case "cyan":
            viewColor.backgroundColor = UIColor.cyan
        default:
            print("Invalid Color")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

