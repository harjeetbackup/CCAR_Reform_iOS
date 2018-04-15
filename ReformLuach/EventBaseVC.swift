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

class EventBaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource, FooterViewDelegate  {
    
    @IBOutlet internal var tblParshiyot: UITableView!
    
    var events = [RLEvent]()
    var filteredEvents = [RLEvent]()
    var tableFooterView: FooterView?
    var searchType:EventType?
    var isScrolledToCurrentDate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblParshiyot.estimatedRowHeight = 60.0
        tblParshiyot.rowHeight = UITableViewAutomaticDimension
        tableFooterView = FooterView.footerView()
        self.tableFooterView?.loadMoreDelegate = self
        self.tblParshiyot.tableFooterView = tableFooterView
        self.tblParshiyot.contentInset.bottom += tableFooterView?.frame.size.height ?? 0
        loadEvents()
        NotificationCenter.default.addObserver(self, selector: #selector(EventBaseVC.newEventsDidLoaded), name: NotificationCalenderChangeNewEventsDidLoaded, object: nil)
    }
    
    func loadEvents() {
        self.view.showHud("Loading..")
        EventManager.shared.fetchEvents(year: EventManager.shared.currentYear()) { (events) in
            self.view.hideHud()
            self.events = events
            self.filterAsPerType();
            self.tblParshiyot.reloadData()
            self.scrollToCurrentDate()
        }
    }
    
    func loadMoreEvents(year: Int) {
        self.view.showHud("Loading..")
        EventManager.shared.fetchEvents(year: year) { (events) in
            self.view.hideHud()
            self.events = events
            self.filterAsPerType();
            self.tblParshiyot.reloadData()
        }
    }
    
    func scrollToCurrentDate() {
            let dateFarmater = DateFormatter()
            dateFarmater.dateFormat = "yyyy-MM-dd"
            let currentDate = Date()
            
            var index: Int? = nil
            for event in self.filteredEvents {
                if let ed = event.date {
                    let eventDate = dateFarmater.date(from: ed)
                    let result = eventDate?.compare(currentDate)
                    if result == .orderedDescending {
                        index = self.filteredEvents.index(where: { (searchEvent) -> Bool in
                            guard event.title != nil, event.date != nil else {
                                return false
                            }
                            
                            return (event.title! == searchEvent.title && event.date! == searchEvent.date)
                        })
                        break
                    }
                }
            }
            
            guard let localIndex = index else { return }
            
            let indePath = IndexPath.init(row: localIndex, section: 0)
            self.tblParshiyot.scrollToRow(at: indePath, at: .top, animated: false)
    }
    
    func newEventsDidLoaded() {
        self.events = EventManager.shared.events
        self.filterAsPerType();
        self.tblParshiyot.reloadData()
        self.scrollToCurrentDate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollToCurrentDate()
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
    
    func filterAsPerType() {
        // Child class needs to implement
    }
}
