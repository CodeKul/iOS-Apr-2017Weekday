//
//  imageViewController.swift
//  dashBoardDemo
//
//  Created by Codekul on 02/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class imageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageBottomConstrain: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.minimumZoomScale = 0.5
        self.scrollView.delegate = self
        
        
        imageView.image = UIImage.init(named: "ABC.jpg")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    

    

}
