//
//  ViewController.swift
//  JsonParsingWithDelegate
//
//  Created by Codekul on 29/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {

    var session : URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var req = URLRequest(url: URL(string: "https://httpbin.org/post")!)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try! JSONSerialization.data(withJSONObject: ["username" : "codekul", "password" : "12345"], options: [])
        
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let dataTask = session?.dataTask(with: req)
        
        dataTask?.resume()
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        let jsonDict = try! JSONSerialization.jsonObject(with: data, options: [])
        print(jsonDict)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        if error != nil {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

