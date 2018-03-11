//
//  EventBaseVCViewController.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 07/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit

class EventBaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet internal var tblParshiyot: UITableView!
    
    var events = [RLEvent]()
    var filteredEvents = [RLEvent]()
    var tableFooterView: FooterView?
    var searchType:EventType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableFooterView = FooterView.footerView()
        self.tableFooterView?.loadDelegate = self as? LoadDelegate
        self.tblParshiyot.tableFooterView = tableFooterView
        EventManager.shared.fetchEvents(eventType: .all, year: 2017) { (events) in
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
        vc.eventUrl = event.link
        self.present(vc, animated: false, completion: nil)
    }
    
    func fetchEvents(year: Int) {
        EventManager.shared.fetchEvents(eventType: .all, year: year) { (events) in
            self.events = events
            self.filterAsPerType();
            self.tblParshiyot.reloadData()
        }
    }
    
    func filterAsPerType() {
        // Child class needs to implement
    }
}
