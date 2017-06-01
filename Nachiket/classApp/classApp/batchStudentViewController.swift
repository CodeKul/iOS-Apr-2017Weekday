//
//  batchStudentViewController.swift
//  classApp
//
//  Created by Codekul on 23/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class batchStudentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var studInfo : [Student]?
    var selectedStudent : Student?
    var batchNameBVC : Batch?
    var courseNameBSVC : Course?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table Data
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (studInfo?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! batchStudentTableViewCell
        cell.txtName.text = studInfo?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if editingStyle == .delete {
            let deleteData = studInfo?[indexPath.row]
            context.delete(deleteData!)
            appDelegate.saveContext()
        }
        getData()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStudent = studInfo?[indexPath.row]
        performSegue(withIdentifier: "showStudentInfo", sender: Any?.self)
    }
    
    
    

    //MARK: - GetData
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let selectData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        selectData.predicate = NSPredicate(format: "ANY studentToBatch == %@", batchNameBVC!)
        do {
            studInfo = try context.fetch(selectData) as? [Student]
        } catch  {
            print("error")
        }
    }
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addStudentToBatch" {
            let addBatchStudentVC = segue.destination as! addBatchStudentViewController
            
            addBatchStudentVC.batchNameASBVC = batchNameBVC
            addBatchStudentVC.courseNameASBVC = courseNameBSVC
        }
        else if segue.identifier == "showStudentInfo" {
            let studInfoVC = segue.destination as! studentInformationViewController
            studInfoVC.studentSIVC = selectedStudent
            studInfoVC.courseSIVC = courseNameBSVC
            studInfoVC.batchSIVC = batchNameBVC
            studInfoVC.checkSegue = false
        }
    }
    
 

}
