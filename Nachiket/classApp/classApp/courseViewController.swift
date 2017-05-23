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
    var courseName : [Course] = []
    var uniqueData : [String] = []
    
    
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return (uniqueData.count)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! courseTableViewCell
        
        cell.txtName.text = uniqueData[indexPath.row]
        
        cell.infoButton.addTarget(self, action: #selector(infoClicked(_ :)), for: .touchUpInside)
        cell.infoButton.tag = indexPath.row
        return cell
    }

    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let batchInfo = storyboard?.instantiateViewController(withIdentifier: "addBatchViewController") as! addBatchViewController
        let p = courseName[indexPath.row]
        batchInfo.courseName = p.name!
    }*/
    
    
    func infoClicked(_ sender : UIButton){
        let s = uniqueData[sender.tag]
        print("\((s))")
        //let batchInfo = storyboard?.instantiateViewController(withIdentifier: "addBatch") as! addBatchViewController
        let p = (UIApplication.shared.delegate as! AppDelegate)
        
        p.cName = s
        

    }
    
    @IBAction func showBatch(_ sender: Any) {
        performSegue(withIdentifier: "batches", sender: sender)
    }
    

 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            courseName =  try context.fetch(Course.fetchRequest())
            
            for a in courseName {
               uniqueData.append(a.name!)
            }
        } catch  {
            fatalError("errr: \(error)")
        }
        uniqueData = Array(Set(uniqueData))
        uniqueData.sort(){$0 < $1}
        
        
    }
}
