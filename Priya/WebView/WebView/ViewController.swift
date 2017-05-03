//
//  ViewController.swift
//  WebView
//
//  Created by Varun on 25/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

   
    @IBOutlet var txtURL: UITextField!
    @IBOutlet var webView: UIWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var lblError: UILabel!
    @IBAction func btnGo(_ sender: UIButton) {
        
        let url = URL(string: txtURL.text!)
        let req = URLRequest(url: url!)//
        webView.loadRequest(req)
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        activityIndicator.stopAnimating()
        lblError.text = "Error"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

