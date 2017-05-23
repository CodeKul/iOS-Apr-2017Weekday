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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let p = (UIApplication.shared.delegate as! AppDelegate)
        
        lblBatch.text = p.bName
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
    
    @IBAction func saveClicked(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let batchInfo = NSEntityDescription.insertNewObject(forEntityName: "Batch", into: context) as! Batch
        let studentInfo = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        studentInfo.name = txtName.text!
        studentInfo.contactNO = Int16(txtContactNO.text!)!
        studentInfo.paidFee = Int16(txtPaidFee.text!)!
        batchInfo.name = lblBatch.text!
        studentInfo.studentToBatch = batchInfo
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    

}
