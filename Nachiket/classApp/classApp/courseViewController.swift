//
//  courseViewController.swift
//  classApp
//
//  Created by Codekul on 22/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class courseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var courseName : [Course]?
    var selectedCourse : Course?
    var selectedButton = 0

    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    @IBAction func showBatch(_ sender: Any) {
        performSegue(withIdentifier: "batches", sender: sender)
    }
 
    
    //MARK: - GetData
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let selectData = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
            do {
                courseName = try context.fetch(selectData) as? [Course]
            } catch  {
                print("error")
            }
    }
    
    
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "batches" {
            let batchVC = segue.destination as! batchViewController
            
            batchVC.courseNameBVC = selectedCourse
        }
        
        
    }
    
    
    //MARK: - Table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (courseName!.count)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! courseTableViewCell
        cell.txtName.text = courseName?[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCourse = courseName?[indexPath.row]
        performSegue(withIdentifier: "batches", sender: Any?.self)
        
    }

}
