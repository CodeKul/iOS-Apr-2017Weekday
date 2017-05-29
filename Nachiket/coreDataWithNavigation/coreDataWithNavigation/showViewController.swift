//
//  showViewController.swift
//  coreDataWithNavigation
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class showViewController: UIViewController {
    var infoIndex : Student?
    
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var lblAge: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = infoIndex?.name
        lblAge.text = String(describing: infoIndex!.age)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
