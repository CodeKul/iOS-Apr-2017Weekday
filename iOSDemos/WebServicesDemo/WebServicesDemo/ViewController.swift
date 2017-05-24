//
//  ViewController.swift
//  WebServicesDemo
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

    var arrPlants : Array<[String : Any]>?
    var dictPlants : [String : Any]?
    var strData : String?
    var parser : XMLParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.w3schools.com/xml/plant_catalog.xml")
        parser = XMLParser(contentsOf: url!)
        parser?.delegate = self
        
        parser?.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "CATALOG" {
            arrPlants = []
        }
        else if elementName == "PLANT" {
            dictPlants = ["" : ""]
        }
        else {
            strData = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "CATALOG" {
            print("\(arrPlants!)")
        }
        else if elementName == "PLANT" {
            arrPlants?.append(dictPlants!)
        }
        else {
            dictPlants?[elementName] = strData
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

