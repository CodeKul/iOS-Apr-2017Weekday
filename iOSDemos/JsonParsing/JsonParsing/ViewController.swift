//
//  ViewController.swift
//  JsonParsing
//
//  Created by Codekul on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://services.groupkt.com/country/get/all")
        
//        let strUrl = "http://services.groupkt.com/country/get/iso2code/"
        
        
        let req = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let rootDict = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>

                    let responseDict = rootDict["RestResponse"] as! Dictionary<String, Any>
                    let arrResults = responseDict["result"] as! Array<Dictionary<String, Any>>
                    
//                    print(arrResults)
                    
                    for data in arrResults {
                        
                        print("Name: \((data["name"])!)\n")
                    }
                }
                catch {
                }
            }
        }
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

