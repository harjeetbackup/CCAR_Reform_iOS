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
     var tableFooterView: FooterView?
     var allEvents = [RLEvent]()
     var allHolidays = [RLEvent]()
     var allParshath = [RLEvent]()
     var searchType:EventType?
   
     override func viewDidLoad() {
        super.viewDidLoad()
        tableFooterView = FooterView.footerView()
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
//        self.tableFooterView?.frame = view.bounds
        self.tableFooterView?.loadDelegate = self as? LoadDelegate
        self.tblParshiyot.tableFooterView = tableFooterView
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let type = searchType {
                if type == .all {
                    return allEvents.count
                }
                if type == .parshat {
                    return allParshath.count
                }
                if type == .holiday {
                    return allHolidays.count
                }
                return events.count
            }else{
                return events.count
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customCell
        if let type = searchType {
            if type == .all {
                cell.event = allEvents[indexPath.row]
            }
            if type == .parshat {
                cell.event = allParshath[indexPath.row]
            }
            if type == .holiday {
                cell.event = allHolidays[indexPath.row] 
            }
            if type == .none {
                cell.event = events[indexPath.row]
            }
        }else{
            cell.event = events[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        if let type = searchType {
            let event = events[indexPath.row]
            vc.eventUrl = event.link
            if type == .all {
                let event = allEvents[indexPath.row]
                vc.eventUrl = event.link
            }
            if type == .parshat {
                let event = allParshath[indexPath.row]
                vc.eventUrl = event.link
            }
            if type == .holiday {
                let event = allHolidays[indexPath.row]
                vc.eventUrl = event.link
            }
        }else{
            let event = events[indexPath.row]
            vc.eventUrl = event.link
        }
        self.present(vc, animated: false, completion: nil)
    }
   
}
