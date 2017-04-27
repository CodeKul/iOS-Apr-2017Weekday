//
//  FourthViewController.swift
//  NavigationControllerDemo
//
//  Created by Abhi on 27/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gotoSVCPressed(_ sender : UIButton) {
        
        let arrVCs = self.navigationController?.viewControllers
        
        _ = self.navigationController?.popToViewController((arrVCs?[1])!, animated: true)
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
