//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Abhi on 24/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var arrData = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Zero"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.label.text = arrData[indexPath.row]
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        
        return cell
        
    }

    func buttonClicked(_ sender : UIButton) {
        
        print("button :: \(arrData[sender.tag])")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("didSelectItemAt :: \(arrData[indexPath.row])")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

