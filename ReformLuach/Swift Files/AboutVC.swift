//
//  AboutVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/23/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import KYDrawerController

class AboutVC: UIViewController, UIScrollViewDelegate, UIWebViewDelegate {
    @IBOutlet weak var AboutHeaderImage: UIImageView!
    @IBOutlet weak var lblAboutData: UILabel!
    @IBOutlet weak var lblOthetCCARData: UILabel!
    @IBOutlet weak var lblOtherCCARData2: UILabel!
    @IBOutlet weak var myScL: UIView!
    @IBOutlet weak var myScrl: UIScrollView!
    @IBOutlet weak var about_title: UILabel!
    @IBOutlet weak var about_Data: UILabel!
    @IBOutlet weak var aboutData_Height: NSLayoutConstraint!
    @IBOutlet weak var aboutData_Width: NSLayoutConstraint!
    @IBOutlet weak var otherCCAT_Title: UILabel!
    @IBOutlet weak var otherCCAT_Data1: UILabel!
    @IBOutlet weak var otherCCAT_Data1_Height: NSLayoutConstraint!
    @IBOutlet weak var CCARIAMGE: UIView!
    @IBOutlet weak var CCARIAMGE_Height: NSLayoutConstraint!
    @IBOutlet weak var otherCCAT_Data2: UILabel!
    @IBOutlet weak var otherCCAT_Data2_Height: NSLayoutConstraint!
    @IBOutlet weak var AboutTextView: UITextView!
    @IBOutlet weak var About_details: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        myLayout()
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.view.showHud()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.view.hideHud()
    }
    
    func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
    }
    
    func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        let url = Bundle.main.url(forResource: "About", withExtension:"html")
        
        //        let url = Bundle.main.url().URLForResource("About", withExtension:"html")
        let localfilePath = Bundle.main.url(forResource: "About", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        About_details.loadRequest(myRequest as URLRequest);
        About_details.delegate = self;
        About_details.backgroundColor = UIColor.white
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }
    
    func myBackGraound(strmonth: NSInteger) {
        let strimagename = "commanHeader" + "\(strmonth)"
        AboutHeaderImage.image = UIImage(named: strimagename)
    }
  
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}






