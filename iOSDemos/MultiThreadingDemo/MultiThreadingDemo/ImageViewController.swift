//
//  ImageViewController.swift
//  MultiThreadingDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var loader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.startAnimating()
        DispatchQueue.global().async {
            let url = URL(string: "http://vignette1.wikia.nocookie.net/spiderman/images/9/98/Spidey_12.png/revision/latest?cb=20150606182652")
            let imgData = try! Data(contentsOf: url!)
            print("Got imgData")
            
            DispatchQueue.main.async(execute: {
                self.loader.stopAnimating()
                self.imageView.image = UIImage(data: imgData)
                print("Imageview loaded")
            })
        }
        
        
        // Do any additional setup after loading the view.
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
