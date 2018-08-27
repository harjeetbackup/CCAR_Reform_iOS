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
    @IBOutlet weak var lblFullDayHeightCons: NSLayoutConstraint!
    @IBOutlet weak var dateTrailingCons: NSLayoutConstraint!
    @IBOutlet weak var dateLeadingCons: NSLayoutConstraint!
    @IBOutlet weak var LBLMonthTop_cons: NSLayoutConstraint!
    //@IBOutlet var ccarImageViewConstant: NSLayoutConstraint!
    
    var animating : Bool = false
    var strDate: NSInteger!
    var strMonth: NSInteger!
    var strYear: NSInteger!
    var eventTitle : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
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
    
    func loaddata() {
        let parameters:  [String:Any]  = [
            "gy": strYear,
            "gm": strMonth,
            "gd": strDate,
            "g2h": "1",
            "cfg":"json",
            ]
        Alamofire.request("http://www.hebcal.com/converter/", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil {
                    print(response.result.value!)
                    var dic = response.result.value as! [String : Any]
                    let str  =  String (describing: dic["hd"]!)
                    let str1  = String (describing: dic["hm"]!)
                    let str2  = String (describing: dic["hy"]!)
                    self.lblDate?.text = str
                    self.lblMonth?.text = str1
                    self.lblYear?.text = str2
                    if dic["events"] == nil {
                        self.lblday?.text = ""
                    } else {
                        var arrEvent = dic["events"] as! [String]
                        if arrEvent[0] == "Shemot" {
                            self.lblday?.text = "Sh'mot"
                        }
                        self.lblday?.text = arrEvent[0]
                        self.eventTitle = arrEvent[0]
                    }
                    self.lblday?.text = self.lblday?.text?.spellChangedForTitle()
                    let strdd = (self.lblYear?.text!)
                    let strHH = String(self.strYear)
                    let sttt = strdd! + "/" + strHH
                    UserDefaults.standard.setValue( self.lblday?.text, forKey: "CurrentHoliday")
                    UserDefaults.standard.setValue(sttt , forKey: "CurrentYear")
                    UserDefaults.standard.synchronize()
                    NotificationCenter.default.post(name: Notification.Name("NotificationSetDateHoliday"), object:nil)
                }
                break
            case .failure(_):
                print(response.result.error!)
                break
            }
        }
    }
    
    func animate() {
        let rotationAnimation=CABasicAnimation()
        rotationAnimation.keyPath="transform.rotation.y"
        let toValue = M_PI * 1.0 * 1
        let someInterval = CFTimeInterval(0.50)
        rotationAnimation.toValue=toValue
        rotationAnimation.duration=someInterval
        rotationAnimation.isCumulative=true
        rotationAnimation.repeatCount=1
        lblDate?.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        if IS_IPAD_PRO {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 270)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 110)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblmonthHeightCons.constant = 110
            lblFullDayHeightCons.constant = 80
            dateLeadingCons.constant = self.view.frame.size.width * 0.15
            dateTrailingCons.constant = self.view.frame.size.width * 0.15
        }
        if IS_IPAD {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 240)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblmonthHeightCons.constant = 100
            lblFullDayHeightCons.constant = 70
            dateLeadingCons.constant = self.view.frame.size.width * 0.15
            dateTrailingCons.constant = self.view.frame.size.width * 0.15
        } else if IS_IPHONE_5 || IS_IPHONE_4_OR_LESS {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 50)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 50)
            lblmonthHeightCons.constant = 40
            lblFullDayHeightCons.constant = 35
        } else if IS_IPHONE_6_7 {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 125)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 52)
            lblmonthHeightCons.constant = 50
            lblFullDayHeightCons.constant = 35
            LBLMonthTop_cons.constant = 15
        } else if IS_IPHONE_6P_7P {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 150)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 65)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 60)
            lblmonthHeightCons.constant = 65
            lblFullDayHeightCons.constant = 42
            LBLMonthTop_cons.constant = 17
        } else if IS_IPHONE_X {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 125)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 55)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 52)
            lblmonthHeightCons.constant = 70
            lblFullDayHeightCons.constant = 40
            LBLMonthTop_cons.constant = 20
            dateLeadingCons.constant = self.view.frame.size.width * 0.08
            dateTrailingCons.constant = self.view.frame.size.width * 0.08
        } else {
            lblDate?.font = UIFont(name: "Roboto-Thin", size: 240)
            lblMonth?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblYear?.font = UIFont(name: "Roboto-Thin", size: 100)
            lblFulldate?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblday?.font = UIFont(name: "Roboto-Thin", size: 45)
            lblmonthHeightCons.constant = 100
            lblFullDayHeightCons.constant = 70
            //dateLeadingCons.constant = self.view.frame.size.width * 0.15
            //dateTrailingCons.constant = self.view.frame.size.width * 0.15
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMMM dd, yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        lblFulldate?.text = myStringafd
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter1.dateFormat = "MMMM dd"
        let myStrcur = formatter1.string(from: yourDate!)
        UserDefaults.standard.setValue(myStrcur, forKey: "CurrentMonthDate")
        let date = Date()
        let calendar = Calendar.current
        strYear = calendar.component(.year, from: date)
        strMonth = calendar.component(.month, from: date)
        strDate = calendar.component(.day, from: date)
        loaddata()
    }
    
    func myBackGraound(strmonth: NSInteger) {
        let strimagename = "todayBGImage" + "\(strmonth)"
        backGroundImage.image = UIImage(named: strimagename)
    }
    
    @IBAction func btnActionEvent(_ sender: UIButton) {
        ShowCards()
    }
    
    func ShowCards() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailViewFromTodayVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewFromTodayVC") as! DetailViewFromTodayVC
        let strEevnt = (self.eventTitle) as! String
        vc.eventNameFromToday = strEevnt
        self .present(vc, animated: true, completion: nil)
    }
    
    override func  viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lblDate?.layer.cornerRadius = (lblDate?.frame.size.height)!/2
        lblDate?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8324027032)
        lblDate?.layer.borderWidth = 3
        lblDate?.layer.masksToBounds = true
        let date = Date()
        let calendar = Calendar.current
        strYear = calendar.component(.year, from: date)
        strMonth = calendar.component(.month, from: date)
        strDate = calendar.component(.day, from: date)
        UserDefaults.standard.setValue( strMonth, forKey: "monthImageNo")
        myBackGraound(strmonth: strMonth)
    }
}
