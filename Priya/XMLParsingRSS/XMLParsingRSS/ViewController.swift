//
//  ViewController.swift
//  XMLParsingRSS
//
//  Created by Varun on 30/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var newsPaper : Array<String>?
    override func viewDidLoad() {
        
        newsPaper = ["Times Of India"]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (newsPaper?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NewsPaper") as! NewsPaperTableViewCell
        
        if cell == nil{
            
            cell = NewsPaperTableViewCell(style: .default, reuseIdentifier: "NewsPaper")
        }
        
        let s = newsPaper?[indexPath.row]
        cell.txtNewsPaper.text = s
        //cell?.infoButton.addTarget(self, action: #selector(infoClicked(_ :)), for: .touchUpInside)
        //cell?.infoButton.tag = indexPath.row
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

