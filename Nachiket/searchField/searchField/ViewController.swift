//
//  ViewController.swift
//  searchField
//
//  Created by Codekul on 23/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var list = ["Asd", "Wad", "Awd", "Asdfgh", "Wedfg"]
    var autoArray : [String] = []
    var constant = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtField.delegate = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = indexPath.row as Int
        
        cell.textLabel!.text = autoArray[index]
        
        return cell
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let substring = (txtField.text! as NSString).replacingCharacters(in: range, with: string)
        
        searchEntries(substring: substring)
        
        return true
    }
    
    
    func searchEntries(substring : String){
        autoArray.removeAll(keepingCapacity: false)
        
        let substring = substring.lowercased()
        
        for key in list
        {
            let sub = key.lowercased()
            
            
            let myString:NSString! = sub as NSString
            
            let substringRange :NSRange! = myString.range(of: substring)
            
            if (substringRange.location  == 0)
            {
                autoArray.append(key)
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func searchClicked(_ sender: UIButton) {
        
        for a in list {
            if txtField.text == a {
               constant = constant + 1
            }
        }
        if constant == 0 {
            list.append(txtField.text!)
            txtField.text = ""
            tableView.reloadData()
        }
    }
}

