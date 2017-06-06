//
//  ViewController.swift
//  dashBoardDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayDashBoard = jobportal()
    var jobportal1 : Array<jobportal>? = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = jobportal()
            p1.setData(lblName: "search", imageView: "ABC.jpg")
        
        let p2 = jobportal()
            p2.setData(lblName: "Post Jobs", imageView: "BCD.jpg")
        
        let p3 = jobportal()
            p3.setData(lblName: "My Selection", imageView: "CDE.jpg")
        
        let p4 = jobportal()
        p4.setData(lblName: "Posted Jobs", imageView: "CDE.jpg")
        
        jobportal1 = [p1,p2,p3,p4]
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobportal1!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCollectionViewCell
        let index = jobportal1?[indexPath.row]
        cell.lblName.text = index?.lblName
        cell.imageView.image = UIImage.init(named: (index?.imageView)!)
        cell.layer.cornerRadius = 9.0
        cell.layer.masksToBounds = true
        
        switch indexPath.row {
        case 0:
            cell.myView.backgroundColor = #colorLiteral(red: 1, green: 0.3905109473, blue: 0.3418968142, alpha: 1)
        case 1:
            cell.myView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case 2:
            cell.myView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 3:
            cell.myView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        default:
            cell.myView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            performSegue(withIdentifier: "showInfoA", sender: Any?.self)
        }
        else
        {
            performSegue(withIdentifier: "showInfoB", sender: Any?.self)
        }
    }

    @IBAction func addClicked(_ sender: Any) {
//        arrJobs.append("E")
//        collectionView.reloadData()
    }

}

