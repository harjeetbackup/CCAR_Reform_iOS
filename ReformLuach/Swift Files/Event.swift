//
//  SecondViewController.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/22/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation
import Crashlytics

class Event: GLViewPagerViewController, GLViewPagerViewControllerDataSource, GLViewPagerViewControllerDelegate {
    var headerView: UIView!
    var viewControllers: NSArray = NSArray()
    var tabTitles: NSArray = NSArray()
    var myView: UIView!
    var controller1: EventFirstVC?
    var controller2: EventSecondVC?
    var controller3: EventThirdVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Paged Tabs"
        self.setDataSource(newDataSource: self)
        self.setDelegate(newDelegate: self)
        self.padding = 10
        self.leadingPadding = 10
        self.trailingPadding = 10
        self.defaultDisplayPageIndex = 0
        self.tabAnimationType = GLTabAnimationType.GLTabAnimationType_WhileScrolling
        self.indicatorColor = UIColor.init(colorLiteralRed: 1.0/255.0, green: 186.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        self.supportArabic = false
        self.fixTabWidth = false
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        
        if !(controller1 != nil) {
            controller1 = mainStoryboard.instantiateViewController(withIdentifier: "EventFirstVC") as? EventFirstVC
            controller2 = mainStoryboard.instantiateViewController(withIdentifier: "EventSecondVC") as? EventSecondVC
            controller3 = mainStoryboard.instantiateViewController(withIdentifier: "EventThirdVC") as? EventThirdVC
        }
        controller1?.myNavController = navigationController
        controller1?.pagerViewController = self
        controller2?.myNavController = navigationController
        controller2?.pagerViewController = self
        controller3?.myNavController = navigationController
        controller3?.pagerViewController = self
        self.viewControllers = [
            controller1,
            controller2,
            controller3
        ]
        
        self.tabTitles = [ "ALL",
                           "PARSHIYOT",
                           "HOLIDAYS"]
        let left = UISwipeGestureRecognizer(target: self, action: #selector(overrideswipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        let right = UISwipeGestureRecognizer(target: self, action: #selector(overrideSwipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        NotificationCenter.default.addObserver(self, selector: #selector(self.CallRightMove(notification:)), name: Notification.Name("NotificationMoveRight"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.CallLeftMove(notification:)), name: Notification.Name("NotificationMoveLeft"), object: nil)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }
    
    @objc func CallLeftMove(notification: Notification) {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, 2)
    }
    
    @objc func CallRightMove(notification: Notification) {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    func overrideswipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
    }
    
    func overrideSwipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - GLViewPagerViewControllerDataSource
    func numberOfTabsForViewPager(_ viewPager: GLViewPagerViewController) -> Int {
        return self.viewControllers.count
    }
    
    func viewForTabIndex(_ viewPager: GLViewPagerViewController, index: Int) -> UIView {
        let label:UILabel = UILabel.init()
        label.text = self.tabTitles.object(at: index) as? String
        label.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        label.textAlignment = NSTextAlignment.center
        label.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        return label
    }
    
    func contentViewControllerForTabAtIndex(_ viewPager: GLViewPagerViewController, index: Int) -> UIViewController {
        return self.viewControllers.object(at: index) as! UIViewController
    }
    
    // MARK: - GLViewPagaerViewControllerDelegate
    func didChangeTabToIndex(_ viewPager: GLViewPagerViewController, index: Int, fromTabIndex: Int) {
        let prevLabel:UILabel = viewPager.tabViewAtIndex(index: fromTabIndex) as! UILabel
        let currentLabel:UILabel = viewPager.tabViewAtIndex(index: index) as! UILabel
        prevLabel.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        currentLabel.textColor = UIColor.init(colorLiteralRed: 1.0/255.0, green: 183.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    }
    
    func willChangeTabToIndex(_ viewPager: GLViewPagerViewController, index: Int, fromTabIndex: Int, progress: CGFloat) {
        if fromTabIndex == index {
            return;
        }
        let prevLabel:UILabel = viewPager.tabViewAtIndex(index: fromTabIndex) as! UILabel
        let currentLabel:UILabel = viewPager.tabViewAtIndex(index: index) as! UILabel
        prevLabel.transform = CGAffineTransform.identity.scaledBy(x: 1.0 - (0.1 * progress), y: 1.0 - (0.1 * progress))
        currentLabel.transform = CGAffineTransform.identity.scaledBy(x: 0.9 + (0.1 * progress), y: 0.9 + (0.1 * progress))
        currentLabel.textColor =  UIColor.init(colorLiteralRed: 1.0/255.0, green: 183.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        prevLabel.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    }
    
    func widthForTabIndex(_ viewPager: GLViewPagerViewController, index: Int) -> CGFloat {
        let prototypeLabel:UILabel = UILabel.init()
        prototypeLabel.text = self.tabTitles.object(at: index) as? String
        prototypeLabel.textAlignment = NSTextAlignment.center
        prototypeLabel.font = UIFont.systemFont(ofSize: 16.0)
        return (self.view.frame.size.width/3) - 10;
    }
}
