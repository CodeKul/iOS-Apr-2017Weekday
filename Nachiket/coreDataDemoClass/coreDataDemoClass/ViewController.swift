//
//  ViewController.swift
//  coreDataDemoClass
//
//  Created by Codekul on 19/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtRollNo: UITextField!
    
    @IBOutlet weak var txtMarks: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button Clicked
    @IBAction func saveClicked(_ sender: UIButton) {
    }
    @IBAction func showClicked(_ sender: UIButton) {
    }
    @IBAction func searchClicked(_ sender: UIButton) {
    }
    @IBAction func updateClicked(_ sender: UIButton) {
    }
    @IBAction func deleteClicked(_ sender: UIButton) {
    }
  
    // Functions
    func saveData() {
        
    }
    func showData() {
        
    }
    func searchData() {
        
    }
    func updateData() {
        
    }
    func deleteData() {
        
    }


}

