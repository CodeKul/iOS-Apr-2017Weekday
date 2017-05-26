//
//  ViewController.swift
//  WebServices
//
//  Created by Varun on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    var arrBreakfast : Array<[String : Any]>?
    var dictBreakfast : [String : Any]?
    var strData : String?
    var parser : XMLParser?
    
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
            print("\(arrBreakfast!)")
        }
        else if elementName == "food"{
            arrBreakfast?.append(dictBreakfast!)
        }
        else {
            dictBreakfast?[elementName] = strData
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

