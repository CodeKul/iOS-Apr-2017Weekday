//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Abhi on 25/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView : UIWebView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let url = URL(string: "http://www.codekul.com")
//        let req = URLRequest(url: url!)
//        
//        webView.loadRequest(req)
        
        let html = "<html><body><iframe width=\"290\" height=\"180\" src=\"https://www.youtube.com/embed/QOyCL-gqu1I\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        
        
        webView.loadHTMLString(html, baseURL: nil)
        
        
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (request.url?.absoluteString.contains("facebook"))! {
            
            return false
        }
        
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

