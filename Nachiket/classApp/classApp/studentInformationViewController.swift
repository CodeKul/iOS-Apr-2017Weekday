//
//  studentInformationViewController.swift
//  classApp
//
//  Created by Codekul on 31/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class studentInformationViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblContactNo: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblBatch: UILabel!
    @IBOutlet weak var lblPaidFee: UILabel!
    var courseSIVC : Course?
    var batchSIVC : Batch?
    var studentSIVC : Student?
    var studentsInfoSIVC = [String : Any]()
    var checkSegue : Bool?
    
    
    override func viewWillAppear(_ animated: Bool) {
        if checkSegue! {
            lblPaidFee.text = String(describing: studentsInfoSIVC["paidFee"] as! Int64)
            lblName.text = studentsInfoSIVC["name"] as? String
            lblBatch.text = studentsInfoSIVC["batchName"] as? String
            lblCourse.text = studentsInfoSIVC["courseName"] as? String
            lblContactNo.text = String(describing: studentsInfoSIVC["contactNo"] as! Int64)
            checkSegue = false
            }
        else{
            lblName.text = studentSIVC?.name
            lblContactNo.text = String(describing: studentSIVC!.contactNO)
            lblPaidFee.text = String(describing:studentSIVC!.paidFee)
            lblCourse.text = courseSIVC?.name
            lblBatch.text = batchSIVC?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}
