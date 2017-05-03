//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var arrStudent : Array<student>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let s1 = student(studentName: "Tom", roleNo: 10, marks: 80.5, grade: 1, photo: "Tom.jpeg")
        let s2 = student(studentName: "Jerry", roleNo: 20, marks: 90, grade: 2, photo: "Jerry.jpeg")
        let s3 = student(studentName: "Mickey", roleNo: 30, marks: 75, grade: 3, photo: "Mickey.png")
        arrStudent = [s1,s2,s3]
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as! StudentTableViewCell?
        
        if cell == nil{
            
            cell = StudentTableViewCell(style: .default, reuseIdentifier: "studentCell")
        }
      
    let s = arrStudent?[indexPath.row]
    cell?.lblName.text = s?.studentName
    cell?.lblRoleNo.text = "\((s?.roleNo)!)"
    cell?.lblMarks.text = "\((s?.marks)!)"
    cell?.imgPhoto.image = UIImage(named: (s?.photo)!)
    cell?.infoButton.addTarget(self, action: #selector(infoClicked(_ :)), for: .touchUpInside)
    cell?.infoButton.tag = indexPath.row
        
    return cell!
    }
    
    func infoClicked(_ sender : UIButton){
        let s = arrStudent?[sender.tag]
        print("\((s?.grade)!)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

