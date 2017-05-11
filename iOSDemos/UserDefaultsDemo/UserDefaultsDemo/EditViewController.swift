//
//  EditViewController.swift
//  UserDefaultsDemo
//
//  Created by Abhi on 11/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var nameTxt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonClicked(_ sender : UIButton) {
        
        UserDefaults.standard.set(nameTxt.text, forKey: "name")
        UserDefaults.standard.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
