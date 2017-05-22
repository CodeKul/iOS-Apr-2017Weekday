//
//  ViewController.swift
//  SQLLiteStudent
//
//  Created by Varun on 17/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db: OpaquePointer? = nil
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtRNo: UITextField!
    @IBOutlet var txtMarks: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.openDB()
    }
    
    func openDB() {
        
        let fileManger = FileManager.default
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let destinationPath = documentDirectoryPath.appending("/Student.db")
        
        print(destinationPath)
        
        if !fileManger.fileExists(atPath: destinationPath) {
            let sourcePath = Bundle.main.path(forResource: "Student", ofType: "db")
            try! fileManger.copyItem(atPath: sourcePath!, toPath: destinationPath)
        }
        
        if sqlite3_open(destinationPath, &db) != SQLITE_OK {
            print("error opening database")
        }
    }
    
    func saveData() {
        
        if sqlite3_exec(db, "INSERT INTO StudInfo VALUES ('\(txtName.text!)', '\(txtRNo.text!)','\(txtMarks.text!)')", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
        else {
            print("Data saved successfully")
        }
        self.textClearTextFeild()
    }
    
    func updateData() {
        
        if sqlite3_exec(db, "UPDATE StudInfo SET Name = '\(txtName.text!)', Marks = '\(txtMarks.text!)' WHERE RNo = '\(txtRNo.text!)'", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
        else {
            print("Data saved successfully")
        }
        self.textClearTextFeild()
    }

    func deleteData() {
        
        if sqlite3_exec(db, "DELETE FROM StudInfo WHERE RNo = '\(txtRNo.text!)'", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
        else {
            print("Data deleted successfully")
        }
        self.textClearTextFeild()
    }

    
    func textClearTextFeild() {
        txtRNo.text = " "
        txtName.text = " "
        txtMarks.text = " "
    }

    func getDataFromDB() {
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, "SELECT * FROM StudInfo", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let name = sqlite3_column_text(statement, 0)
            let nameString = String(cString: name!)
            print("Name = \(nameString)")
            
            if let rno = sqlite3_column_text(statement, 1) {
                let rnoString = String(cString: rno)
                print("Role No = \(rnoString)")
            } else {
                print("rno not found")
            }
            
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
                print("marks = \(marksString)")
            } else {
                print("marks not found")
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
    }

    func searchData()
    {
        
        var statement: OpaquePointer? = nil
        
        let x = txtRNo.text
        let query = "SELECT * FROM StudInfo WHERE RNo =\(x!)"
        
        
        if sqlite3_prepare_v2(db, query , -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing search: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            if let rno = sqlite3_column_text(statement, 1) {
                let rnoString = String(cString: rno)
                print("Role No = \(rnoString)")
            } else {
                print("rno not found")
            }
            
            let name = sqlite3_column_text(statement, 0)
            let nameString = String(cString: name!)
            //print("Name = \(nameString)")
            txtName.text = nameString
            
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
               // print("marks = \(marksString)")
                txtMarks.text = marksString
            } else {
                print("marks not found")
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
    

    }
    
    @IBAction func btnDelete(_ sender: Any) {
        self.deleteData()
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        self.updateData()
    }
    
    @IBAction func btnSave(_ sender: Any) {
        self.saveData()
    }
    
    @IBAction func btnShow(_ sender: Any) {
        
        self.getDataFromDB()
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        self.searchData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

