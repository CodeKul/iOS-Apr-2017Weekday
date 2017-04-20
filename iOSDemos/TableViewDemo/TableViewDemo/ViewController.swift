//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Varun on 20/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var players : Array<String>?
    var contries : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        players = ["Sachin","Sehwag","Virat","Dhoni","Yuvraj","Zahir Khan","Ganguly","Dravid","Laxman","Kumbale","Shami"]
        
        contries = ["India", "England", "Pakistan", "Austrelia", "West Indies", "RSA"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return (players?.count)!
        }
        
        return (contries?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Players"
        }
        return "Contries"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = "\((players?[indexPath.row])!)"
            cell?.textLabel?.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        }
        else {
            cell?.textLabel?.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            
            cell?.textLabel?.text = "\((contries?[indexPath.row])!)"
        }
        
        print("cellForRowAt indexPath")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var strData = ""
        
        if indexPath.section == 0 {
            strData = (players?[indexPath.row])!
        }
        else {
            strData = (contries?[indexPath.row])!
        }
        print(strData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

