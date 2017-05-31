//
//  ViewController.swift
//  WebServices
//
//  Created by Varun on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var arrBreakfast : Array<[String : Any]>?
    var dictBreakfast : [String : Any]?
    var strData : String?
    var parser : XMLParser?
    @IBOutlet var brekfastTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.w3schools.com/xml/simple.xml")
        parser = XMLParser(contentsOf: url!)
        parser?.delegate = self
        parser?.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "breakfast_menu"{
            arrBreakfast = []
        }
        else if elementName == "food"{
            dictBreakfast = ["" : ""]
        }
        else {
            strData = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "breakfast_menu"{
            //print("\(arrBreakfast!)")
            DispatchQueue.main.async {
                self.brekfastTableView.reloadData()
            }
            
        }
        else if elementName == "food"{
            arrBreakfast?.append(dictBreakfast!)
        }
        else {
            dictBreakfast?[elementName] = strData
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrBreakfast?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "BreakFastCell") as! BreakfastTableViewCell!
        
        if cell == nil{
            
            cell = BreakfastTableViewCell(style: .default, reuseIdentifier: "BreakFastCell")
        }
        let s = arrBreakfast?[indexPath.row]
        cell?.name.text = s?["name"] as? String
        cell?.price.text = s?["price"] as? String
        cell?.desc.text = s?["description"] as? String
        cell?.cal.text = s?["calories"] as? String
        
        return cell!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

