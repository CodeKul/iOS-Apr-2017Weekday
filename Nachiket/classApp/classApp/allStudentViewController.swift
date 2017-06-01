//
//  allStudentViewController.swift
//  classApp
//
//  Created by Codekul on 31/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class allStudentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var studentInfo : [Student]?
    var courseInfo : [Course]?
    var courseStudents : Array<[String : Any]>?
    var students : [String : Any]?
    var courseObj : Course?
    var studentASVC : Student?
    var studentInfoASVC = [String : Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        courseStudents = []
        getData()
        tableview.reloadData()
    }
    
    
    //MARK: - Getdata
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let selectCourse = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        do {
            courseInfo = try context.fetch(selectCourse) as? [Course]
        } catch  {
            print("error")
        }
        for a in courseInfo! {
            courseObj = a
            students = Dictionary()
            let selectStudents = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
            selectStudents.predicate = NSPredicate(format: "ANY studentToCourse = %@", a)
            
            do {
                studentInfo = try context.fetch(selectStudents) as? [Student]
            } catch  {
                print("error")
            }
            for info in studentInfo! {
                
                let cName = (info.studentToCourse?.allObjects)! as NSArray
                let bName = (info.studentToBatch?.allObjects)! as NSArray
                var a = cName.value(forKey: "name") as! [String]
                
                students?["name"] = info.name
                students?["contactNo"] = info.contactNO
                students?["paidFee"] = info.paidFee
                students?["courseName"] = a[0]
                
                a = bName.value(forKey: "name") as! [String]
                students?["batchName"] = a[0]
                courseStudents?.append(students!)
            }
            
        }
        //print(courseStudents!)
    }
    
    
    
    
    //MARK: - Table Data
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (courseStudents?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! allStudentTableViewCell
        
        var index = courseStudents?[indexPath.row]
        cell.lblName.text = index?["name"] as? String
        cell.lblCOurse.text = index?["courseName"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentInfoASVC = (courseStudents?[indexPath.row])!
        print(studentInfoASVC)
        performSegue(withIdentifier: "studentInfoFromStudent", sender: Any?.self)
    }
    
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "studentInfoFromStudent" {
            let studVC = segue.destination as! studentInformationViewController
            
            studVC.studentsInfoSIVC = studentInfoASVC
            studVC.checkSegue = true
        }
        
        
    }
    
}
