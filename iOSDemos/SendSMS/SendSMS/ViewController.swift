//
//  ViewController.swift
//  SendSMS
//
//  Created by Codekul on 05/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController , MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result.rawValue {
        case MessageComposeResult.cancelled.rawValue:
            print("cancelled")
            
        case MessageComposeResult.failed.rawValue:
            print("failed")

        case MessageComposeResult.sent.rawValue:
            print("sent")

        default:
            print("default")
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("\(result)")
    }
    
    @IBAction func sendSMS(_ sender : UIButton){
        
        if(MFMessageComposeViewController.canSendText())
        {
            let messageVC = MFMessageComposeViewController()
            messageVC.recipients = []
            messageVC.body = "hello !! this is a test SMS"
            messageVC.messageComposeDelegate = self
        
            present(messageVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendEmail(_ sender : UIButton){
        
        
        if(MFMailComposeViewController.canSendMail()) {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("Test Mail")
            mailVC.setMessageBody("Hello \n This is a test mail !!", isHTML: false)
            mailVC.setToRecipients(["codekul@gmail.com"])
            mailVC.mailComposeDelegate = self
            
            present(mailVC, animated: true, completion: nil)
        }
    }
    
}

