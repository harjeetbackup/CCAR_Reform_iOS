//
//  EventBaseVCViewController.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 07/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit
import MBProgressHUD

var day: Int?

class EventBaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet internal var tblParshiyot: UITableView!
    
    var events = [RLEvent]()
    var filteredEvents = [RLEvent]()
    var tableFooterView: FooterView?
    var searchType:EventType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblParshiyot.estimatedRowHeight = 60.0
        tblParshiyot.rowHeight = UITableViewAutomaticDimension
        tableFooterView = FooterView.footerView()
        self.tableFooterView?.loadDelegate = self as? LoadDelegate
        self.tblParshiyot.tableFooterView = tableFooterView
        loadEvents()
        NotificationCenter.default.addObserver(self, selector: #selector(EventBaseVC.loadEvents), name: NotificationCalenderChange, object: nil)
    }
    
    func loadEvents(){

        EventManager.shared.fetchEvents(eventType: .all, year: yearCount) { (events) in
            self.events = events
            self.filterAsPerType();
            self.tblParshiyot.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customCell
        cell.event = filteredEvents[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let event = filteredEvents[indexPath.row]
        print(event.title as Any)
        day = getDayOfWeek(today: event.date!)
        print(day as Any)
        vc.eventUrl = event.title?.html()
        self.present(vc, animated: false, completion: nil)
    }
    
    
    func getDayOfWeek(today:String)->Int {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday
        return weekDay!
    }
    
    func fetchEvents(year: Int) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        EventManager.shared.fetchEvents(eventType: .all, year: year) { (events) in
            MBProgressHUD.hide(for: self.view, animated: true)
            self.events = events
            self.filterAsPerType();
            self.tblParshiyot.reloadData()
        }
    }
    
    func filterAsPerType() {
        // Child class needs to implement
    }
}
