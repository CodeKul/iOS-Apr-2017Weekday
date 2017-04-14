//
//  ViewController.swift
//  BasicControls
//
//  Created by Varun on 13/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lbl = UILabel(frame: CGRect(x: 10, y: 30, width: 260, height: 30))
        
        lbl.text = "iOS Batch"
        lbl.textAlignment = .center
        
        lbl.textColor = UIColor.blue
        
        lbl.backgroundColor = UIColor.gray
//        self.view.addSubview(lbl)
        
        let view1 = UIView()
        
        view1.frame = CGRect(x: 20, y: 80, width: 280, height: 150)
        
        view1.backgroundColor = UIColor.cyan
        
        self.view.addSubview(view1)
        
        view1.addSubview(lbl)
        
        let btn = UIButton(frame: CGRect(x: 110, y: view1.frame.origin.y + view1.frame.size.height + 20, width: 100, height: 30))
        
        btn.setTitle("GO", for: .normal)
        btn.backgroundColor = UIColor.red
        
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
    }

    func btnClicked() {
        
        self.view.backgroundColor = UIColor.green
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

