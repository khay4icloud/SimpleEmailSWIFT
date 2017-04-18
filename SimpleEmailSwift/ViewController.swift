//
//  ViewController.swift
//  SimpleEmailSwift
//
//  Created by Sri Kalyan Ganja on 4/18/17.
//  Copyright © 2017 KLYN. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func showEmail(_ sender: Any) {
        
        let mailComposeVC = MFMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            
            mailComposeVC.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            mailComposeVC.setSubject("Hello!")
            mailComposeVC.setMessageBody("iOS Programing is so fun!", isHTML: false)
            mailComposeVC.setToRecipients(["prikal@gmail.com"])
            
            // Present the view controller modally 
            self.present(mailComposeVC, animated: true, completion: nil)
            
        } else {
            
            print("Mail services are not available")
            return
        }
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Check the result or perfom other tasks
        switch result {
        case .cancelled :
            print("Mail cancelled by user")
        case .saved :
            print("Mail saved by user")
        case .sent :
            print("Mail sent by user")
        case .failed :
            print("Mail failed with %@",error?.localizedDescription ?? "Failed")
        default:
            print("Mail not sent")
        }
    }

}

