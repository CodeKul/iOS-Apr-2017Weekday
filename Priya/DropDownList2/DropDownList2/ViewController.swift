//
//  ViewController.swift
//  DropDownList2
//
//  Created by Varun on 13/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    @IBOutlet var tableView :UITableView!
    @IBOutlet var list1 : UIButton!
    @IBOutlet var list2 : UIButton!
    @IBOutlet var dropdownView : UIView!
    
    @IBOutlet var textField: UITextField!
    
    
    var arrNoticePeroid = ["6 month","7 month","8 month"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrNoticePeroid.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrNoticePeroid[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.textField.text = self.arrNoticePeroid[indexPath.row]
        self.dropdownView.isHidden = true
    }
    //uitextfield Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.tableView{
            
            self.dropdownView.isHidden = false
            tableView.endEditing(true)
            
        }

    }
    @IBAction func listButtonpressed(_ sender: UIButton){
        if dropdownView.isHidden {
            dropdownView.isHidden = false
        } else {
            dropdownView.isHidden = true
        }
    }
}

