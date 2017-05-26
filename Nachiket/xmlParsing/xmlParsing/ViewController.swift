//
//  ViewController.swift
//  xmlParsing
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    var breakfast : Array<[String : Any]>?
    var food : [String : String]?
    var strData = ""
    var parser = XMLParser()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.w3schools.com/xml/simple.xml")
        parser = XMLParser(contentsOf: url!)!
        parser.delegate = self
        parser.parse()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK:- Parsing
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "breakfast_menu" {
            breakfast = []
        } else if elementName == "food" {
            food = Dictionary()
        }
        else {
            strData = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "breakfast_menu" {
            
            //print(breakfast!)
            tableView.reloadData()
        } else if elementName == "food" {
            breakfast?.append(food!)
        }
        else {
            food?[elementName] = strData
        }
    }

    
    //MARK:- Table data
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (breakfast?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! showTableViewCell
        
        let index = breakfast?[indexPath.row]
        cell.txtName.text = (index?["name"] as! String)
        cell.txtCal.text = (index?["calories"] as! String)
        cell.txtPrice.text = (index?["price"] as! String)
        cell.txtDesc.text = (index?["description"] as! String)
        return cell
    }
    
    

}

