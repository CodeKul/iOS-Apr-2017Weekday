//
//  ImageViewController.swift
//  MultiThreading
//
//  Created by Varun on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    @IBOutlet var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startAnimating()
        DispatchQueue.global().async {
            let url = URL(string: "https://s-media-cache-ak0.pinimg.com/736x/af/74/6f/af746f3f641e1cd5a477bff1fcde4d06.jpg")
            let imgData = try! Data(contentsOf: url!)
            print("Got imgData")
            
            DispatchQueue.main.async(execute: {
                self.loader.stopAnimating()
                self.img.image = UIImage(data: imgData)
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
