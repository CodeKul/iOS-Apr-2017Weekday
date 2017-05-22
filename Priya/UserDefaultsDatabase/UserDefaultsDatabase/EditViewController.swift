//
//  EditViewController.swift
//  UserDefaultsDatabase
//
//  Created by Varun on 11/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var txtName : UITextField?
    @IBOutlet var txtClass : UITextField?
    @IBOutlet var txtRoleNo : UITextField?
    @IBOutlet var txtCity : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveBtnClicked(_ sender : UIButton){
      UserDefaults.standard.set(txtName?.text, forKey: "Name")
      UserDefaults.standard.set(txtClass?.text, forKey: "Class")
      UserDefaults.standard.set(txtRoleNo?.text, forKey: "rno")
      UserDefaults.standard.set(txtCity?.text, forKey: "City")
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
