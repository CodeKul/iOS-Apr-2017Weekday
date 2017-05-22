//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var txtrno: UITextField!

    @IBOutlet var txtName: UITextField!
    
    @IBOutlet var txtMarks: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func btnSave(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let stu = NSEntityDescription.entity(forEntityName: "Student", in: context) as! Student
        stu.rno = txtrno.text
        stu.name = txtName.text
        stu.marks = txtMarks.text
        
        appDelegate.saveContext()
        clearFields()
    }
    
    func clearFields(){
      
        txtrno.text = ""
        txtName.text = ""
        txtMarks.text = ""
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

