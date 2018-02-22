//
//  DetailVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/30/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit

class DetailVC: UIViewController
{
    
    var eventType = String()
    var eventName = String()
    
     @IBOutlet weak var eventDetails: UIWebView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
   
       let url = Utils.getUrl(eventType: eventType, eventName: eventName)
       
        eventDetails.loadRequest(URLRequest(url: url!))

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnActionBAck(_ sender: UIButton)
    {
        self .dismiss(animated: false, completion: nil)
    }

  
    

}
