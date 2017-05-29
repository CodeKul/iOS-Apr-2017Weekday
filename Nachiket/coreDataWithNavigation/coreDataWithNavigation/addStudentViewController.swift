//
//  addStudentViewController.swift
//  coreDataWithNavigation
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class addStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtCourse: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var coursePicker: UIPickerView!
    var cName : [Course]?
    var courseName : Course?
  
    override func viewWillAppear(_ animated: Bool) {
        getCourseData()
        coursePicker.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        
        saveData.setValue(txtName.text!, forKey: "name")
        saveData.setValue(Int16(txtAge.text!), forKey: "age")
        saveData.addToStudentToCourse(courseName!)
        
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func getCourseData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
        do {
            cName = try context.fetch(selectQuery) as? [Course]
        } catch  {
            
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (cName?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print(Cname[row])
        return String(describing: (cName?[row].name)!)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtCourse.text = String(describing: (cName?[row].name)!)
        courseName = cName?[row]
    }
}


