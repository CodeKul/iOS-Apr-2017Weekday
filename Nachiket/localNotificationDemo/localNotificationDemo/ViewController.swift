//
//  ViewController.swift
//  localNotificationDemo
//
//  Created by Codekul on 31/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtDate: UITextField!
    
    var selectedDate : Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func setReminderClicked(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.scheduleNotification(date: selectedDate!)
        
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        txtDate.text = ("\(String(describing: selectedDate!))")
    }
}

