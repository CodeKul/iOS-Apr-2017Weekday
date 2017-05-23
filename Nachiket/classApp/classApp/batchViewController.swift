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
    
    var batchInfo : [Batch] = []
    var batchCName : [Batch] = []
    let p = (UIApplication.shared.delegate as! AppDelegate)

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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batchInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! batchTableViewCell
        
        let info = batchInfo[indexPath.row]
        
        cell.lblName.text = info.name
        cell.lblDate.text = info.startDate
        cell.lblTime.text = info.time
        
        cell.infoButton.addTarget(self, action: #selector(infoClicked(_ :)), for: .touchUpInside)
        cell.infoButton.tag = indexPath.row
        
        return cell
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        var selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Batch")
        
        do {
            batchCName = try context.fetch(selectQuery) as! [Batch]
            
        } catch  {
            fatalError("Error \(error)")
        }
        
        let x = batchCName[0]
        print(x.course?.name! as Any)
        
        selectQuery = NSFetchRequest<NSFetchRequestResult>(entityName: "Batch")
        
        selectQuery.predicate = NSPredicate(format: "course.name = %@", p.cName)
        
        do {
             batchInfo = try context.fetch(selectQuery) as! [Batch]
            
        } catch  {
            fatalError("Error \(error)")
        }
    }
    
    
    
    
    
    //MARK:- infoButtonClicked
    func infoClicked(_ sender : UIButton){
        let s = batchInfo[sender.tag]
        print("\((s))")
        //let batchInfo = storyboard?.instantiateViewController(withIdentifier: "addBatch") as! addBatchViewController
        let p = (UIApplication.shared.delegate as! AppDelegate)
        
        p.bName = s.name!
        
    }

    
    @IBAction func showBatchStudent(_ sender: UIButton) {
        performSegue(withIdentifier: "showBatchStudents", sender: sender)
    }
    
    

}
