//
//  addCourseViewController.swift
//  coreDataWithNavigation
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class addCourseViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    var cName : [Course]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Course", into: context)
        
        saveData.setValue(txtName.text, forKey: "name")
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cName?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! courseTableViewCell
        
        cell.lblCourse.text = String(describing: (cName![indexPath.row].name)!)
        
        return cell
    }
    
    
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
        do {
            cName = try context.fetch(selectQuery) as? [Course]
        } catch  {
            
        }
    }

}
