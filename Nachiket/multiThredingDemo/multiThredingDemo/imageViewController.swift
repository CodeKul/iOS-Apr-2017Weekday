//
//  imageViewController.swift
//  multiThredingDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startAnimating()
        DispatchQueue.global().async {
            let url = URL(string: "http://vignette1.wikia.nocookie.net/spiderman/images/9/98/Spidey_12.png/revision/latest?cb=20150606182652")
            let image = try! Data(contentsOf: url!)
            
            DispatchQueue.main.async(execute: {
                self.loader.stopAnimating()
                self.imageView.image = UIImage(data: image)
                print("Imageview loaded")
            })

        }
        loader.stopAnimating()
        
    }
}
