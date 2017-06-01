//
//  ViewController.swift
//  LocalNotification
//
//  Created by Varun on 31/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {

    @IBOutlet var dtDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnShowAlarm(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        
        let date = dtDatePicker.date
        
        let df1 = DateFormatter()
        df1.dateFormat = "hh"
        
        let df2 = DateFormatter()
        df2.dateFormat = "mm"
        
        print(df1.string(from: date))
        print(df2.string(from: date))
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: nil)
        
        // Configure the trigger for a 7am wakeup.
        var dateInfo = DateComponents()
        dateInfo.hour = Int(df1.string(from: date))
        dateInfo.minute = Int(df2.string(from: date))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
        
        // Schedule the request.
        center.add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

