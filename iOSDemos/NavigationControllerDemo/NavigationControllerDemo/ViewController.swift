//
//  ViewController.swift
//  NavigationControllerDemo
//
//  Created by Abhi on 27/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myArray : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.myGlobalVar = "Codekul"
        
        myArray = ["Red", "Green", "Blue", "Yellow", "Cyan", "Magenta", "Brown", "Gray"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func gotoFifthVC(sender : UIBarButtonItem) {
        
        let fifthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fifthVC") as! FifthViewController
        
        fifthVC.arrData = myArray
        
        self.navigationController?.pushViewController(fifthVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

