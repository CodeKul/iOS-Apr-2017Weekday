//
//  CitiesViewController.swift
//  XMLParsingRSS
//
//  Created by Varun on 01/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var arrCities : Array<String>?
    
    
    override func viewDidLoad() {
       
        arrCities = ["Mumbai","Delhi","Banglore","Hyderabad","Chennai"]
        super.viewDidLoad()

        }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrCities?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "City") as! CitiesTableViewCell
        
        if cell == nil{
            
            cell = CitiesTableViewCell(style: .default, reuseIdentifier: "City")
        }
        
        let s = arrCities?[indexPath.row]
        cell.lblCities.text = s
        
        return cell
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
