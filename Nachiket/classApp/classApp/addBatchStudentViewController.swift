//
//  addBatchStudentViewController.swift
//  classApp
//
//  Created by Codekul on 23/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class addBatchStudentViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtContactNO: UITextField!
    @IBOutlet weak var txtPaidFee: UITextField!
    @IBOutlet weak var lblBatch: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    
    var batchNameASBVC : Batch?
    var courseNameASBVC : Course?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        lblBatch.text = batchNameASBVC?.name
        lblCourse.text = courseNameASBVC?.name
    }
    
    
    /*
    // MARK: - Save
     */
    
    @IBAction func saveClicked(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let studentInfo = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        studentInfo.name = txtName.text!
        let x = Int64(txtContactNO.text!)!
        print(x)
        studentInfo.contactNO = x
        studentInfo.paidFee = Int64(txtPaidFee.text!)!
        studentInfo.addToStudentToBatch(batchNameASBVC!)
        studentInfo.addToStudentToCourse(courseNameASBVC!)

        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    

}
