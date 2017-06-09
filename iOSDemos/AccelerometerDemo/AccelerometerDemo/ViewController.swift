//
//  ViewController.swift
//  AccelerometerDemo
//
//  Created by Codekul on 02/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager : CMMotionManager?
    @IBOutlet var xLbl : UILabel!
    @IBOutlet var yLbl : UILabel!
    @IBOutlet var zLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        motionManager = CMMotionManager()
        motionManager?.accelerometerUpdateInterval = 0.1
        motionManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            
            self.xLbl.text = "\((data?.acceleration.x)!)"
            self.yLbl.text = "\((data?.acceleration.y)!)"
            self.zLbl.text = "\((data?.acceleration.z)!)"
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

