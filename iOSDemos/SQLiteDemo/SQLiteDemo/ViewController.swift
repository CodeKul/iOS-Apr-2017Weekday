//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Codekul on 16/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var db: OpaquePointer? = nil

    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtRno : UITextField!
    @IBOutlet var txtMarks : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.openDB()
    }

    func openDB() {
        
        let fileManger = FileManager.default
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let destinationPath = documentDirectoryPath.appending("/StuInfo.db")
        
        print(destinationPath)
        
        if !fileManger.fileExists(atPath: destinationPath) {
            let sourcePath = Bundle.main.path(forResource: "StuInfo", ofType: "db")
            try! fileManger.copyItem(atPath: sourcePath!, toPath: destinationPath)
        }
        
        if sqlite3_open(destinationPath, &db) != SQLITE_OK {
            print("error opening database")
        }
    }

    func saveData() {
        
        if sqlite3_exec(db, "INSERT INTO Student VALUES ('\(txtRno.text!)', '\(txtName.text!)','\(txtMarks.text!)')", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
        else {
            print("Data saved successfully")
        }
        self.textClearTextFeild()
    }

    func getDataFromDB() {
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, "SELECT * FROM Student", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let rno = sqlite3_column_text(statement, 0)
            let rnoString = String(cString: rno!)
            print("Rno = \(rnoString)")
            
            if let name = sqlite3_column_text(statement, 1) {
                let nameString = String(cString: name)
                print("name = \(nameString)")
            } else {
                print("name not found")
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
    
    
    @IBAction func saveBtnClk (_ sender : UIButton){
        self.saveData()
    }
    
    @IBAction func showBtnClk (_ sender : UIButton){
        self.getDataFromDB()
    }


    func textClearTextFeild() {
        txtRno.text = " "
        txtName.text = " "
        txtMarks.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

