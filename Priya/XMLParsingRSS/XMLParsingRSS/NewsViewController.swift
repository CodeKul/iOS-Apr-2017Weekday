//
//  NewsViewController.swift
//  XMLParsingRSS
//
//  Created by Codekul on 07/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {

    var arrNews : Array<[String : Any]>?
    var dictNews : [String : Any]?
    var strData : String?
    var parser : XMLParser?
    var selCity : String?
    var url : Any?
    var isItem = false
    
    @IBOutlet var newTableView : UITableView!
    		
    override func viewDidLoad() {
        super.viewDidLoad()
       
        switch selCity! {
        case "Mumbai":
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/-2128838597.cms")
        case "Delhi":
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/-2128839596.cms")
        case "Banglore":
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/-2128833038.cms")
        case "Hyderabad":
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/-2128816011.cms")
        case "Chennai":
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/2950623.cms")
        default:
            url = URL(string: "http://timesofindia.indiatimes.com/rssfeeds/2950623.cms")
        }
        parser = XMLParser(contentsOf: url as! URL)
        parser?.delegate = self
        parser?.parse()
        isItem = false
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "channel"{
            arrNews = []
        }
        else if elementName == "item"{
            dictNews = ["" : ""]
            isItem = true
        }
        else if isItem {
            strData = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "channel"{
            //print("\(arrNews!)")
            DispatchQueue.main.async {
                self.newTableView.reloadData()
            }
         }
        else if elementName == "item"{
            arrNews?.append(dictNews!)
        }
        else {
            if (elementName == "description") {
                dictNews?["desc"] = strData
            }
            else
            {
             dictNews?[elementName] = strData
            }
        }
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrNews?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "News") as! NewsTableViewCell!
        
        if cell == nil{
            
            cell = NewsTableViewCell(style: .default, reuseIdentifier: "News")
        }
        let s = arrNews?[indexPath.row]
        cell?.lblTitle.text = s?["title"] as? String
        cell?.lblDesc.text = s?["desc"] as? String
        cell?.lblPubDate.text = s?["pubDate"] as? String
        cell?.lblLink.text = s?["link"] as? String
        
        return cell!
        
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
