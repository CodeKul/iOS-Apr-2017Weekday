//
//  ViewController.swift
//  TouchesDemo
//
//  Created by Codekul on 06/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var view2 : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let longPressGest = UILongPressGestureRecognizer(target: self, action: #selector(view2Pressed))
        longPressGest.minimumPressDuration = 2
        
        view2.addGestureRecognizer(longPressGest)
    
    }
    
    func view2Pressed(_ sender : UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            print("Pressed")
        }
    }
    
    @IBAction func view1Tapped (_ sender : UITapGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        
        print("Tapped")
        print("x: \(point.x)\ny: \(point.y)")
    }
    
/*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

