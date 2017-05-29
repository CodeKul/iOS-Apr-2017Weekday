//
//  ViewController.swift
//  coreDataWithNavigation
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var studInfo : [Student]?
    var selectedStudent : Student?
    var selectedButton : Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func infoButtonClicked(_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! studentTableViewCell
        selectedButton = cell.infoButton.tag
         
        
        
        selectedStudent = studInfo?[selectedButton]
        
        performSegue(withIdentifier: "show", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "show" {
            let showVC = segue.destination as! showViewController
            
            showVC.infoIndex = selectedStudent
        }
        
        
    }
    
    
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let selectData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        do {
            studInfo = try context.fetch(selectData) as? [Student]
        } catch  {
            print("error")
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (studInfo?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! studentTableViewCell
        cell.lblName.text = studInfo?[indexPath.row].name
        let age = String(describing: studInfo![indexPath.row].age)
        cell.lblAge.text = age
        cell.infoButton.tag = indexPath.row
        selectedButton = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedStudent = studInfo?[indexPath.row]
        performSegue(withIdentifier: "show", sender: (Any).self)
               
    }
    
    
    
    

}

