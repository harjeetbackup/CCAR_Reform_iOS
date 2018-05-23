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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextFirst(notification:)), name: Notification.Name("NotificationTextFirst"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearFirst(notification:)), name: Notification.Name("NotificationClearFirst"), object: nil)
    }
    
    override func filterAsPerType() {
        // No need to filter
        self.filteredEvents = self.events
    }
    
    @objc func filterTextFirst(notification: Notification) {
    var str = notification.object.unsafelyUnwrapped
        if str is String {
           let str1 = str as! String
           str  = str1.replacingOccurrences(of: "’", with: "'")
        }
    let characters = String(describing: str)
        if events.count != 0 {
            self.filteredEvents = events.filter({(event : RLEvent) -> Bool in
                return (event.spellChangedTitle?.contains(characters))!
            })
            searchType = EventType.all
            self.tblParshiyot.reloadData()
        }
    }
    
    @objc func filterClearFirst(notification: Notification)
    {
        filterAsPerType()
        searchType = EventType.none
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        self.tblParshiyot.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        eventType = EventType.all
        searchType = EventType.none
        self.tblParshiyot.reloadData()
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? GLViewPagerViewController
        {
            classBVC.delegate = self as? GLViewPagerViewControllerDelegate
        }
    }
}
