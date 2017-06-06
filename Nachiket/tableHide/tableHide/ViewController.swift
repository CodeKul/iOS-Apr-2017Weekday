//
//  ViewController.swift
//  tableHide
//
//  Created by Codekul on 23/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var gender = ["Male", "Female"]
    var status = ["Married", "Unmarried"]
    var thrid = ["1", "2"]
    var forth = ["3", "4","5", "6", "7"]
    
    @IBOutlet weak var txtGender: UITextField!
    
    @IBOutlet weak var txtThrid: UITextField!
    
    @IBOutlet weak var txtStatus: UITextField!
    
    @IBOutlet weak var txtForth: UITextField!
    
    
    
    var show = false
    var constant = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
            }
    
    
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
        switch constant {
        case 0:
            return gender.count
        case 1:
            return status.count
        case 2:
           return thrid.count
        case 3:
            return forth.count
        default:
           return gender.count
        }
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! infoTableViewCell
        
        
        switch constant {
        case 0:
            cell.txtInfo.text  = gender[indexPath.row]
        case 1:
            cell.txtInfo.text  = status[indexPath.row]
        case 2:
            cell.txtInfo.text  = thrid[indexPath.row]
        case 3:
            cell.txtInfo.text  = forth[indexPath.row]
        default:
            cell.txtInfo.text  = gender[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch constant {
        case 0:
            txtGender.text = gender[indexPath.row]
        case 1:
            txtStatus.text  = status[indexPath.row]
        case 2:
            txtForth.text  = thrid[indexPath.row]
        case 3:
            txtThrid.text  = forth[indexPath.row]
        default:
            print(gender[indexPath.row])
        }

    }
    
    
    
    
    @IBAction func genderClicked(_ sender: UIButton) {
        
        if tableView.isHidden {
            tableView.isHidden = false
        }
        else{
            tableView.isHidden = true
        }
        constant = 0
        tableView.reloadData()
    }
    @IBAction func statusClicked(_ sender: UIButton) {
        if tableView.isHidden {
            tableView.isHidden = false
        }
        else{
            tableView.isHidden = true
        }
        constant = 1
        tableView.reloadData()
    }
    
    @IBAction func forthClicked(_ sender: UIButton) {
        
        if tableView.isHidden {
            tableView.isHidden = false
        }
        else{
            tableView.isHidden = true
        }
        constant = 2
        tableView.reloadData()
    }
    @IBAction func firstClicked(_ sender: UIButton) {
        if tableView.isHidden {
            tableView.isHidden = false
        }
        else{
            tableView.isHidden = true
        }
        constant = 3
        tableView.reloadData()
    }
}

