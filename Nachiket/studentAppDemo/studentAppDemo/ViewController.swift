//
//  ViewController.swift
//  studentAppDemo
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var studentInfo : [Student]?
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(String(describing: studentInfo!.count))")
        return (studentInfo?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! infoTableViewCell
        
        cell.lblName.text = studentInfo?[indexPath.row].fName
        cell.lblLName.text = studentInfo?[indexPath.row].lName
        cell.lblAge.text = (String(describing: studentInfo![indexPath.row].age))
        
        return cell
    }

    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        do {
            studentInfo = try context.fetch(selectQuery) as? [Student]
            print(studentInfo!)
            tableView.reloadData()
            
        } catch  {
            print("error")
        }
    }
}

