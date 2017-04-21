//
//  ViewController.swift
//  CustomCellDemo
//
//  Created by Varun on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrPlayers : Array<Player>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = Player(name: "Sachin", age: 50, score: 10000, imageName: "sachin.jpg")
        let p2 = Player(name: "Yuvraj", age: 40, score: 10000, imageName: "yuvraj.jpg")
        let p3 = Player(name: "Dhoni", age: 40, score: 10000, imageName: "dhoni.jpg")
        
        arrPlayers = [p1, p2, p3]
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (arrPlayers?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as! PlayerTableViewCell?
        
        if cell == nil {
            
            cell = PlayerTableViewCell(style: .default, reuseIdentifier: "playerCell")
        }
        
        let p = arrPlayers?[indexPath.row]
        
        cell?.nameLbl.text = p?.name
        cell?.ageLbl.text = "\((p?.age)!)"
        cell?.scoreLbl.text = "\((p?.score)!)"
        cell?.profileImageView.image = UIImage(named: (p?.imageName)!)

        cell?.infoButton.addTarget(self, action: #selector(infoButtonClicked(_ :)), for: .touchUpInside)
        cell?.infoButton.tag = indexPath.row
        
        return cell!
    }
    
    func infoButtonClicked(_ sender : UIButton) {
        
        let p = arrPlayers?[sender.tag]
        
        print("\((p?.name)!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

