//
//  ViewController.swift
//  JsonParser
//
//  Created by Varun on 26/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtCountry: UITextField!
    
    @IBOutlet var txtName: UITextField!
    
    @IBOutlet var txtAlpha1: UITextField!
    
    @IBOutlet var txtAlpha2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnShow(_ sender: Any) {
        
        let strUrl = "http://services.groupkt.com/country/get/iso2code/" + txtCountry.text!
        let url = URL(string: strUrl)
        
        let req = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let rootDict = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>
                    
                    let responseDict = rootDict["RestResponse"] as! Dictionary<String, Any>
                    let arrResults = responseDict["result"] as! Dictionary<String, Any>
                    print(arrResults)
                    print(arrResults["name"]!)
                    
                    DispatchQueue.main.async {
                        self.txtName.text = arrResults["name"] as? String
                        self.txtAlpha1.text = arrResults["name"] as? String
                        self.txtAlpha2.text = arrResults["alpha3_code"] as? String
                    }
                }
                    
                catch {
                }
            }
            //txtName.text = "AA"
        }
        dataTask.resume()
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

