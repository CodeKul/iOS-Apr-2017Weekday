//
//  FifthViewController.swift
//  NavigationControllerDemo
//
//  Created by Abhi on 27/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var lbl1 : UILabel!
    
    var arrData : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if arrData == nil {
            arrData = []
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = arrData?[indexPath.row]
    
        return cell!
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colour : UIColor?
        
        switch indexPath.row {
        case 0:
            colour = UIColor.red
        case 1:
            colour = UIColor.green
        case 2:
            colour = UIColor.blue
        case 3:
            colour = UIColor.yellow
        case 4:
            colour = UIColor.cyan
        case 5:
            colour = UIColor.magenta
        case 6:
            colour = UIColor.brown
        case 7:
            colour = UIColor.gray
        default:
            colour = UIColor.white
        }
        let sixthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sixth") as! SixthViewController
        
        sixthVC.bgcolour = colour!
        
        
        self.navigationController?.pushViewController(sixthVC, animated: true)
        
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
