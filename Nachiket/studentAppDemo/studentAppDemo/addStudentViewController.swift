//
//  addStudentViewController.swift
//  studentAppDemo
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class addStudentViewController: UIViewController {

    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtFName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
        
        saveData.setValue(txtFName.text, forKey: "fName")
        saveData.setValue(txtLName.text, forKey: "lName")
        saveData.setValue(Int16(txtAge.text!), forKey: "age")
        
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
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
