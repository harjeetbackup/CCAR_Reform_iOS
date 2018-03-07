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

class EventSecondVC: EventBaseVC {
    
    var myNavController: UINavigationController?
    var arrParshita = NSArray()
    var arrTotalParshita = NSArray()
    
    
    var  data:[[String:String]] = []
    var  columnTitles:[String] = []

    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextSecond(notification:)), name: Notification.Name("NotificationTextSecond"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearSecond(notification:)), name: Notification.Name("NotificationClearSecond"), object: nil)
    }
    
    @objc func filterTextSecond(notification: Notification)
    {
        let str = notification.object
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
                arrParshita = (arrTotalParshita as NSArray).filtered(using: predicate) as NSArray
        
        tblParshiyot.reloadData()
    }
    
    @objc func filterClearSecond(notification: Notification)
    {
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        arrParshita = (arrTotalParshita as NSArray)
        tblParshiyot.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        EventManager.shared.fetchEvents { (events) in
            
            let filered = events.filter({ (event) -> Bool in
                if let cat = event.category {
                    if cat == "parashat" {
                        return true
                    }
                }
                return false
            })
            
            self.events = filered
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
