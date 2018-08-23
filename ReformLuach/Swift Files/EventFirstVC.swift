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
    var  data:[[String:String]] = []
    var  columnTitles:[String] = []
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextFirst(notification:)), name: Notification.Name("NotificationTextFirst"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearFirst(notification:)), name: Notification.Name("NotificationClearFirst"), object: nil)
    }
    override func filterAsPerType() {
        // No need to filter
        self.filteredEvents = self.events
    }
    
    @objc func filterTextFirst(notification: Notification) {
        searchType = EventType.all
        let str = notification.object.unsafelyUnwrapped as? String
        self.searchString = str?.replacingOccurrences(of: "’", with: "'")
    }
    
    @objc func filterClearFirst(notification: Notification) {
        filterAsPerType()
        searchType = EventType.none
        self.searchString = nil
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        self.tblParshiyot.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? GLViewPagerViewController {
            classBVC.delegate = self as? GLViewPagerViewControllerDelegate
        }
    }
}
