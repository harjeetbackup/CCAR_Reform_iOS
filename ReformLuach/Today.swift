//
//  FirstViewController.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/22/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class Today: UIViewController {
    @IBOutlet weak var MyView: UIView!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var lblDate:UILabel?
    @IBOutlet weak var lblMonth:UILabel?
    @IBOutlet weak var lblYear:UILabel?
    @IBOutlet weak var lblFulldate:UILabel?
    @IBOutlet weak var lblday:UILabel?
    @IBOutlet weak var dayView:UIView?
    
    @IBOutlet weak var lblmonthHeightCons: NSLayoutConstraint!
//    @IBOutlet weak var lblyearHeightCons: NSLayoutConstraint!
    @IBOutlet weak var lblFullDayHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var dateTrailingCons: NSLayoutConstraint!
    @IBOutlet weak var dateLeadingCons: NSLayoutConstraint!
    @IBOutlet weak var LBLMonthTop_cons: NSLayoutConstraint!
    
    var animating : Bool = false
    
    var strDate: NSInteger!
    var strMonth: NSInteger!
    var strYear: NSInteger!
    
//    var dic: Dictionary<Key: Hashable, Any>!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
//        self.navigationController?.navigationBar.barStyle = .default
//        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)

        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
      
        // Do any additional setup after loading the view, typically from a nib.
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


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loaddata()
    {
        
        let parameters:  [String:Any]  = [
            "gy": strYear,
            "gm": strMonth,
            "gd": strDate,
            "g2h": "1",
            "cfg":"json",
            
            ]
      
        
        //let url = URL(string: "http://www.hebcal.com/converter/?cfg=json&gy=2011&gm=6&gd=2&g2h=1")
//        let url = URL(string: "http://www.hebcal.com/converter/")
//        var statusCode: Int = 0
        
        
        Alamofire.request("http://www.hebcal.com/converter/", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result)
            {
            case .success(_):
                if response.result.value != nil
                {
                    print(response.result.value!)
                    
                    var dic = response.result.value as! [String : Any]
                    let str  =  String (describing: dic["hd"]!)
                    let str1  = String (describing: dic["hm"]!)
                    let str2  = String (describing: dic["hy"]!)
                    self.lblDate?.text = str
                    self.lblMonth?.text = str1
              //      ============================

//                    if str1 == "Shemot"{
//                         self.lblMonth?.text = "Sh'mot"
//                    }else {
//                        self.lblMonth?.text = str1
//                    }
            //      ============================

                    
                    self.lblYear?.text = str2
                    
                    if dic["events"] == nil
                    {
                         self.lblday?.text = ""
                    }
                    else
                    {
                        var arrEvent = dic["events"] as! [String]
                        self.lblday?.text = arrEvent[0]//
                    }
                
          ////////////////////////////////////////////////
                    
                    if  (dic["events"] as AnyObject) as! String == "Shemot" {
                        self.lblday?.text = "Sh'mot"
                    }
         //////////////////////////////////////////////////
                    
                    let strdd = (self.lblYear?.text!)
                    let strHH = String(self.strYear)
                    
                    let sttt = strdd! + "/" + strHH
                    
                    UserDefaults.standard.setValue( self.lblday?.text, forKey: "CurrentHoliday")
                    UserDefaults.standard.setValue(sttt , forKey: "CurrentYear")

                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
                
            }
        }
       
    }
    
//    func performAction()
    func animate()
    {
        let rotationAnimation=CABasicAnimation();
        
        rotationAnimation.keyPath="transform.rotation.y"
        
        let toValue = M_PI * 1.0 * 1 ;
        
        
        // passing it a float
        let someInterval = CFTimeInterval(0.50)
        
        rotationAnimation.toValue=toValue;
        rotationAnimation.duration=someInterval;
        rotationAnimation.isCumulative=true;
        rotationAnimation.repeatCount=1;
//        MyView.layer.add(rotationAnimation, forKey: "rotationAnimation")
        lblDate?.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
    }

    
//    override func viewDidAppear(_ animated: Bool)
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

//        var image = UIImage(CGImage: backGroundImage.image!.CGImage, scale: 1.0, orientation: .DownMirrored)
//        let flippedImage = backGroundImage.imageFlippedForRightToLeftLayoutDirection()
//        backGroundImage.transform = CGAffineTransform(scaleX: -1, y: 1)

//        self.perform(#selector(performAction), with: nil, afterDelay: 2.0)
//        self.perform(#selector(animate), with: nil, afterDelay: 2.0)
        
//        startSpinning()
        
        if IS_IPAD_PRO
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 270)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblmonthHeightCons.constant = 110;
//            lblyearHeightCons.constant = 45;
            lblFullDayHeightCons.constant = 80;
            dateLeadingCons.constant = self.view.frame.size.width * 0.15
//            dayView?.layer.cornerRadius = (dayView?.frame.size.height)!/2;
//            dayView?.layer.borderColor = UIColor.white.cgColor;
//            dayView?.layer.borderWidth = 1;
//            dayView?.layer.masksToBounds = true;

            
        }
        if IS_IPAD
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 240)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblmonthHeightCons.constant = 100;
//            lblyearHeightCons.constant = 45;
            lblFullDayHeightCons.constant = 70;
             dateLeadingCons.constant = self.view.frame.size.width * 0.15
            dateTrailingCons.constant = self.view.frame.size.width * 0.15
            
//            dayView?.layer.cornerRadius = (dayView?.frame.size.height)!/2;
//            dayView?.layer.borderColor = UIColor.white.cgColor;
//            dayView?.layer.borderWidth = 1;
//            dayView?.layer.masksToBounds = true;

        }
        else if IS_IPHONE_5 || IS_IPHONE_4_OR_LESS
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 50)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 50)
            lblmonthHeightCons.constant = 50;
//            lblyearHeightCons.constant = 45;
            lblFullDayHeightCons.constant = 35;
            
        }
        else if IS_IPHONE_6_7
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 125)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 52)
            lblmonthHeightCons.constant = 50;
//            lblyearHeightCons.constant = 55;
            lblFullDayHeightCons.constant = 35;
            LBLMonthTop_cons.constant = 15
            dateLeadingCons.constant = self.view.frame.size.width * 0.08
            dateTrailingCons.constant = self.view.frame.size.width * 0.08

        }
        else if IS_IPHONE_6P_7P
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 150)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 65)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 60)
            lblmonthHeightCons.constant = 65;
//            lblyearHeightCons.constant = 70;
            lblFullDayHeightCons.constant = 42;
            LBLMonthTop_cons.constant = 17
            dateLeadingCons.constant = self.view.frame.size.width * 0.08
            dateTrailingCons.constant = self.view.frame.size.width * 0.08
        }
        else if IS_IPHONE_X
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 125)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 52)
            lblmonthHeightCons.constant = 80;
            //            lblyearHeightCons.constant = 55;
            lblFullDayHeightCons.constant = 50;
            LBLMonthTop_cons.constant = 30
            dateLeadingCons.constant = self.view.frame.size.width * 0.08
            dateTrailingCons.constant = self.view.frame.size.width * 0.08
            
        }
        else
        {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 240)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblmonthHeightCons.constant = 100;
            //            lblyearHeightCons.constant = 45;
            lblFullDayHeightCons.constant = 70;
            dateLeadingCons.constant = self.view.frame.size.width * 0.15
            dateTrailingCons.constant = self.view.frame.size.width * 0.15

        }
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMMM dd, yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        
        lblFulldate?.text = myStringafd;
        
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter1.dateFormat = "MMMM dd"
        
        let myStrcur = formatter1.string(from: yourDate!)
        UserDefaults.standard.setValue(myStrcur , forKey: "CurrentMonthDate")
        
        
        let date = Date()
        let calendar = Calendar.current
        
        strYear = calendar.component(.year, from: date)
        strMonth = calendar.component(.month, from: date)
        strDate = calendar.component(.day, from: date)
        
        
//        dayView?.layer.cornerRadius = (dayView?.frame.size.height)!/2;
//        dayView?.layer.borderColor = UIColor.white.cgColor;
//        dayView?.layer.borderWidth = 1;
//        dayView?.layer.masksToBounds = true;
        
//        lblDate?.layer.cornerRadius = (lblDate?.frame.size.height)!/2;
//        lblDate?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8324027032);
//        lblDate?.layer.borderWidth = 3;
//        lblDate?.layer.masksToBounds = true;
        
//        let format1 = DateFormatter()
//        format1.timeZone = NSTimeZone(name: "he_IL") as TimeZone!
//        format1.dateFormat = "dd MMM, yyyy HH:mm"
//        let stringDate: String = format1.string(from: Date())
//        print("defaultDate: \(stringDate)")
//        
//        print("\(NSTimeZone.abbreviationDictionary)")
       
       
        
        loaddata()
       
//        let strHoliday = UserDefaults.standard.string(forKey: "monthImageNo")
    }
    
    
    func myBackGraound(strmonth: NSInteger)
    {
        let strimagename = "todayBGImage" + "\(strmonth)"
        backGroundImage.image = UIImage(named: strimagename)
    }

    @IBAction func btnActionEvent(_ sender: UIButton)
    {
        ShowCards()
    }
    func ShowCards()
    {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailViewFromTodayVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewFromTodayVC") as! DetailViewFromTodayVC
        
        let strEevnt = (self.lblday?.text) as! String
        
        vc.eventNameFromToday = strEevnt
        
        self .present(vc, animated: true, completion: nil)
    }
    
    
    override func  viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
//        dayView?.layer.cornerRadius = (dayView?.frame.size.height)!/2;
//        dayView?.layer.borderColor = UIColor.white.cgColor;
//        dayView?.layer.borderWidth = 1;
//        dayView?.layer.masksToBounds = true;
        lblDate?.layer.cornerRadius = (lblDate?.frame.size.height)!/2;
        lblDate?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8324027032);
        lblDate?.layer.borderWidth = 3;
        lblDate?.layer.masksToBounds = true;
        
        
        let date = Date()
        let calendar = Calendar.current
        
        strYear = calendar.component(.year, from: date)
        strMonth = calendar.component(.month, from: date)
        strDate = calendar.component(.day, from: date)
        
        UserDefaults.standard.setValue( strMonth, forKey: "monthImageNo")
        
        myBackGraound(strmonth: strMonth)
    }
//    func myLayouy()
//    {
//        dayView?.layer.cornerRadius = (dayView?.frame.size.height)!/2;
//        dayView?.layer.borderColor = UIColor.white.cgColor;
//        dayView?.layer.borderWidth = 1;
//        dayView?.layer.masksToBounds = true;
//    }
}

