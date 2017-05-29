//
//  ViewController.swift
//  jasonParsning
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var responseDict = Dictionary<String, Any>()
    var arrMessages = Dictionary<String, String>()
    var arrResults = Dictionary<String, String>()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        getData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showClicked(_ sender: Any) {
        getData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let x = (responseDict.count) / 2
        return responseDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! nationInfoTableViewCell
        cell.lblName.text = arrResults["name"]
        cell.lblalpha2code.text = (arrResults["alpha2_code"])!
        cell.lblalpha3code.text = (arrResults["alpha3_code"])!
        return cell
    }
    
    func getData(){
        let url = URL(string: "http://services.groupkt.com/country/get/iso2code/\(txtName.text!)")
        let req = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let rootDict = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>
                    
                    self.responseDict = rootDict["RestResponse"] as! Dictionary<String, Any>
                    self.arrResults = self.responseDict["result"] as! Dictionary<String, String>
                    
                    print(self.arrResults)
                }
                catch {
                }
            }
        }
        dataTask.resume()
        tableView.reloadData()
    }
}

