//
//  ViewController.swift
//  MoreControls
//
//  Created by Varun on 14/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl : UISegmentedControl!
    
    @IBOutlet var lbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.selectedSegmentIndex = 1
        
        self.segmentedControlValueChanged(segmentedControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControlValueChanged(_ sender : UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.red
        }
        else if sender.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor.green
        }
        else {
            self.view.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func sliderValueChanged(_ sender : UISlider) {
        
        lbl.text = "\(sender.value)"
        
    }

    @IBAction func switchValueChanged(_ sender : UISwitch) {
        
        if sender.isOn {
            segmentedControl.isUserInteractionEnabled = true
        }
        else {
            segmentedControl.isUserInteractionEnabled = false

        }
    }

    @IBAction func datePickerValueChanged(_ sender : UIDatePicker) {
        
        let date = sender.date
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY hh:mm:ss a"
        
        print(df.string(from: date))
    }
}








