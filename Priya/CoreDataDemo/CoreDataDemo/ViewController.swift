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
        let stu = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        stu.rno = txtrno.text!
        stu.name = txtName.text!
        stu.marks = txtMarks.text!
        
        appDelegate.saveContext()
        clearFields()
    }
    
    func clearFields(){
      
        txtrno.text = ""
        txtName.text = ""
        txtMarks.text = ""
    }
    
    @IBAction func btnShow(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let studentFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do{
            let fetchStudent = try context.fetch(studentFetch) as! [Student]
            
            for stu in fetchStudent {
                print("Role No : \(stu.rno!) \n Name : \(stu.name!)\nMarks : \(stu.marks!)")
            }
        }catch{
            fatalError("Failed to fetch students : \(error)")
        }
        
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let studentFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        studentFetch.predicate = NSPredicate(format: "rno == %@", txtrno.text!)
        do{
            let fetchStudent = try context.fetch(studentFetch) as! [Student]
            
            for stu in fetchStudent {
                txtName.text = stu.name!
                txtMarks.text = stu.marks!
            }
        }catch{
            fatalError("Failed to fetch students : \(error)")
        }
        
        
    }
    
    
    @IBAction func btnUpdate(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let studentFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        studentFetch.predicate = NSPredicate(format: "rno == %@", txtrno.text!)
        do{
            let fetchStudent = try context.fetch(studentFetch) as! [Student]
            
            fetchStudent[0].name = txtName.text!
            fetchStudent[0].marks = txtMarks.text!
            
        }catch{
            fatalError("Failed to fetch students : \(error)")
        }
        
        clearFields()
        
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let studentFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        studentFetch.predicate = NSPredicate(format: "rno == %@", txtrno.text!)
        
        do{
            let fetchStudent = try context.fetch(studentFetch) as! [Student]
            
            context.delete(fetchStudent[0])
            appDelegate.saveContext()
            
        }catch{
            fatalError("Failed to fetch students : \(error)")
        }

        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

