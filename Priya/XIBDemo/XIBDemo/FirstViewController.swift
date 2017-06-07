//
//  FirstViewController.swift
//  XIBDemo
//
//  Created by Varun on 05/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonClicked(_ sender: UIButton){
     
        var SVC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        
        self.navigationController?.pushViewController(SVC, animated: true)
        
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
