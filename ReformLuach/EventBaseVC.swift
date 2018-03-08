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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customCell
        cell.event = events[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let event = events[indexPath.row]
        vc.eventUrl = event.link
        self.present(vc, animated: false, completion: nil)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        tableFooterView = FooterView.footerView()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        self.tableFooterView?.frame = view.bounds
        
        self.tableFooterView?.loadDelegate = self as? LoadDelegate
        return tableFooterView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
}
