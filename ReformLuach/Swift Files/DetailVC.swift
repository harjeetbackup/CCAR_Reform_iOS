//
//  DetailVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/30/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UIWebViewDelegate {
    
    var eventUrl: String?
    var day : Int?
    @IBOutlet weak var eventDetails: UIWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        eventDetails.delegate = self
        if let urlStr = eventUrl {
           if let url = URL.init(string: urlStr) {
                eventDetails.loadRequest(URLRequest(url: url))
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.view.showHud()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.view.hideHud()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
            if let reformLink = request.url {
                if UIApplication.shared.canOpenURL(reformLink) {
                    UIApplication.shared.open(reformLink, options: [:], completionHandler: nil)
                }
            }
            return false
        }
        return true
    }

    @IBAction func btnActionBAck(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
