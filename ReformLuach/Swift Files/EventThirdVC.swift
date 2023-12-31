//
//  EventThirdVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 10/3/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EventThirdVC: EventBaseVC {
    
    var myNavController: UINavigationController?
    var  data:[[String:String]] = []
    var  columnTitles:[String] = []
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextThird(notification:)), name: Notification.Name("NotificationTextThird"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearThird(notification:)), name: Notification.Name("NotificationClearThird"), object: nil)
    }
    
    override func filterAsPerType() {
        self.filteredEvents = events.filter({ (event) -> Bool in
            if let cat = event.category {
                if cat == "holiday" {
                    return true
                } else if cat == "roshchodesh" {
                    return true
                } else if cat == "omer"{
                    return true
                }
            }
            return false
        })
    }
    
    @objc func filterTextThird(notification: Notification) {
        searchType = EventType.holiday
        let str = notification.object.unsafelyUnwrapped as? String
        self.searchString = str?.replacingOccurrences(of: "’", with: "'")
    }
    
    @objc func filterClearThird(notification: Notification) {
        filterAsPerType()
        self.searchString = nil
        searchType = EventType.none
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        tblParshiyot.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? GLViewPagerViewController {
            classBVC.delegate = self as? GLViewPagerViewControllerDelegate
        }
    }
}
