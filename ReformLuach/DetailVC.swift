//
//  DetailVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/30/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var eventUrl: String?
    @IBOutlet weak var eventDetails: UIWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if let urlStr = eventUrl {
           if let url = URL.init(string: urlStr) {
                eventDetails.loadRequest(URLRequest(url: url))
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func btnActionBAck(_ sender: UIButton) {
        self .dismiss(animated: false, completion: nil)
    }
}
