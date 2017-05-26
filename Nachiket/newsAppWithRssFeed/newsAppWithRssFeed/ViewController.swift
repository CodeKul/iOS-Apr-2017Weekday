//
//  ViewController.swift
//  newsAppWithRssFeed
//
//  Created by Codekul on 24/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var channel : Array<[String : Any]>?
    var item : [String : String]?
    var constant = 0
    var isItem = false
    var parcer = XMLParser()
    var str = ""
    var str1 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/-2128821991.cms")
        parcer = XMLParser(contentsOf: url!)!
        parcer.delegate = self
        parcer.parse()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- XML PARSE
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "channel"{
            channel = []
        }else if elementName == "item"{
            isItem = true
            item = Dictionary()
            //print(attributeDict)
        }
        else{
            str = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if isItem {
           str.append(string)
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "channel"{
            print(channel!)
        }else if elementName == "item"{
            channel?.append(item!)
        }
        else
        {
            //let c = str.characters
//            if let space = c.index(of: ">") {
//                // Return substring.
//                // ... Use "after" to avoid including the space in the substring.
//               str1 = str[c.index(after: space)..<str.endIndex]
//                print(str1)
//            }
            
            if let dotRange = str.range(of: "</a>") {
                str.removeSubrange(str.startIndex..<dotRange.upperBound)
                //print(str)
            }
            
            item?[elementName] = str
        }
    }
    
    
    //MARK:- Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (channel?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! newaInfoTableViewCell
        let index = channel?[indexPath.row]
        
        cell.lblTitle.text = (index?["title"] as! String)
        cell.lblDesc.text = (index?["description"] as! String)
        cell.lblLink.text = (index?["link"] as! String)
        cell.lblPubDate.text = (index?["pubDate"] as! String)
        return cell
    }


}

