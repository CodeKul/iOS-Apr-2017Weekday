//
//  ViewController.swift
//  CoreDataEntityRelationship
//
//  Created by Codekul on 19/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func saveButtonClicked(_ sender : UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let emp = NSEntityDescription.insertNewObject(forEntityName:"Employee" , into:context) as! Employee
        
        let comp = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context) as! Company
        
        comp.regId = "123"
        comp.name = "CodeKul"
        comp.addToEmployees(emp)
        
        emp.empId = "1"
        emp.name = "Nachiket"
        emp.company = comp
        
        appDelegate.saveContext()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

