//
//  EventFirstVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 10/3/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation
import CSV
import SwiftyJSON
import Alamofire



class EventFirstVC: EventBaseVC {
    
    var myNavController: UINavigationController?
    
    var arrHolidays = NSArray()
    
    var arrTotalHolidays = NSArray()
    
    var omerDays = NSArray()
    
    var readRoshChodush = NSArray()
    
    var roshChodush = NSArray()
    
    var omerRoshChodush = NSArray()
    
    var parshita = NSArray()
    
    var allArray = NSArray()

    var  data:[[String:String]] = []
    var  columnTitles:[String] = []

    
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextFirst(notification:)), name: Notification.Name("NotificationTextFirst"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearFirst(notification:)), name: Notification.Name("NotificationClearFirst"), object: nil)
    }
    
    
    @objc func filterTextFirst(notification: Notification)
    {
        let str = notification.object
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
        arrHolidays = (allArray as NSArray).filtered(using: predicate) as NSArray
        
        self.tblParshiyot.reloadData()
    }
    
    @objc func filterClearFirst(notification: Notification)
    {
        let str = notification.object
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        arrHolidays = allArray as NSArray
        self.tblParshiyot.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        EventManager.shared.fetchEvents { (events) in
            self.events = events
            self.tblParshiyot.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //MARK: step 5 create a reference of Class B and bind them through the prepareforsegue method
        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? GLViewPagerViewController
        {
            classBVC.delegate = self as? GLViewPagerViewControllerDelegate
        }
    }
}
