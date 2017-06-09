//
//  ViewController.swift
//  ImageViewDemo
//
//  Created by Codekul on 09/06/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showSambagTimePickerViewController(_ sender: UIButton) {
        let vc = SambagTimePickerViewController()
        vc.theme = .dark
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

extension ViewController: SambagTimePickerViewControllerDelegate {
    
    func sambagTimePickerDidSet(_ viewController: SambagTimePickerViewController, result: SambagTimePickerResult) {
//        resultLabel.text = "\(result)"
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func sambagTimePickerDidCancel(_ viewController: SambagTimePickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
