//
//  batchViewController.swift
//  classApp
//
//  Created by Codekul on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class batchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var batchInfo : [Batch]?
    var courseNameBVC : Course?
    var selectedBatch : Batch?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    
    
    //MARK: - Table Data
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batchInfo!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! batchTableViewCell
        let info = batchInfo![indexPath.row]
        cell.lblName.text = info.name
        cell.lblDate.text = info.startDate
        cell.lblTime.text = info.time
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBatch = batchInfo?[indexPath.row]
        performSegue(withIdentifier: "showBatchStudents", sender: Any?.self)
    }
    
   
    
    // MARK: - GetData

    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Batch")
        selectQuery.predicate = NSPredicate(format: "ANY batchToCourse == %@", courseNameBVC!)
        
        do {
            batchInfo = try context.fetch(selectQuery) as? [Batch]
            
        } catch  {
            fatalError("Error \(error)")
        }
    }
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addBatch" {
            let addBatchVC = segue.destination as! addBatchViewController
            addBatchVC.courseNameABVC = courseNameBVC
        }
        else if segue.identifier == "showBatchStudents" {
            let batchStudentVC = segue.destination as! batchStudentViewController
            batchStudentVC.batchNameBVC = selectedBatch
            batchStudentVC.courseNameBSVC = courseNameBVC
        }

    }
    
}
