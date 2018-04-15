//
//  CalenderSyncVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/23/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import EventKit
import EventKitUI
import MBProgressHUD

class EventListCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCross: UIButton!
}

class CalenderSyncVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var btnMajorHoliday: UIButton!
    @IBOutlet weak var btnMinorHoliday: UIButton!
    @IBOutlet weak var btnRoshHoliday: UIButton!
    @IBOutlet weak var btnWeeklyHoliday: UIButton!
    @IBOutlet weak var btnOmerHoliday: UIButton!
    @IBOutlet weak var btnSpecialShabbatot: UIButton!
    @IBOutlet weak var btnModernHolidays: UIButton!
    
    @IBOutlet weak var btnCustomRepeatedEvents: UIButton!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var srrlView: UIScrollView?
    
    @IBOutlet weak var view_WidthCons: NSLayoutConstraint!
    
    
    @IBOutlet weak var HeaderImage: UIImageView!
    
    var event: EKEvent!

    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    
    var eventDetailsArray = [AnyHashable]()
    
    var arrMajorHoliday = NSArray()
    var arrMinorHoliday = NSArray()
    var arrRoshChodesh = NSArray()
    var arrWeeklyParshiyot = NSArray()
    var arrOmerHoliday = NSArray()
    var arrSpecialShabbatot = NSArray()
    var arrModernHolidays = NSArray()
    var arrCustomEventList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        event = EKEvent(eventStore: eventStore)
        

        view_WidthCons.constant = self.view.frame.size.width
        
        
        btnAdd?.layer.cornerRadius = 5;
        btnAdd?.layer.borderColor = UIColor.black.cgColor;
        btnAdd?.layer.borderWidth = 1;
        btnAdd?.layer.masksToBounds = true;
        
        self.buttonView .addSubview(tblView)
        
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        
    }
    
    
    
    func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
    }
    
    func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews()
    {
        srrlView?.contentSize = CGSize(width: self.view.frame.size.width, height: 505)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        checkCalendarAuthorizationStatus()
        
        tblView.frame = CGRect(x: 40, y: 320, width: buttonView.frame.size.width-40, height: 180)
        
        tblView.isScrollEnabled = true
        tblView.isUserInteractionEnabled = true
        
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
        
        
        if UserDefaults.standard.object(forKey: "CustomLst") != nil
        {
            let userdefaults = UserDefaults.standard
            arrCustomEventList = userdefaults.array(forKey: "CustomLst")! as NSArray
            if arrCustomEventList.count > 0
            {
                tblView.isHidden = false
            }
            else
            {
                tblView.isHidden = true
            }
            tblView.reloadData()
        }
    }
    
    func myBackGraound(strmonth: NSInteger)
    {
        let strimagename = "Sync_Header" + "\(strmonth)"
        HeaderImage .image = UIImage(named: strimagename)
    }
    
    @IBAction func exportButtonTapped(_ sender: Any) {
    }

    @IBAction func btnMajorHoliday(_ sender: UIButton)
    {
        if btnMajorHoliday.tag == 101
        {
            loadMajorHoliday()
            btnMajorHoliday.tag = 201
            btnMajorHoliday.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnMajorHoliday.tag = 101
            btnMajorHoliday.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
        
    }
    
    @IBAction func btnMinorHoliday(_ sender: UIButton)
    {
        if btnMinorHoliday.tag == 102
        {
            btnMinorHoliday.tag = 202
            btnMinorHoliday.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnMinorHoliday.tag = 102
            btnMinorHoliday.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    @IBAction func btnRoshHoliday(_ sender: UIButton)
    {
        if btnRoshHoliday.tag == 103
        {
            btnRoshHoliday.tag = 203
            btnRoshHoliday.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnRoshHoliday.tag = 103
            btnRoshHoliday.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    @IBAction func btnWeeklyHoliday(_ sender: UIButton)
    {
        if btnWeeklyHoliday.tag == 104
        {
            btnWeeklyHoliday.tag = 204
            btnWeeklyHoliday.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnWeeklyHoliday.tag = 104
            btnWeeklyHoliday.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    @IBAction func btnOmerHoliday(_ sender: UIButton)
    {
        if btnOmerHoliday.tag == 105
        {
            btnOmerHoliday.tag = 205
            btnOmerHoliday.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnOmerHoliday.tag = 105
            btnOmerHoliday.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    @IBAction func btnSpecialShabbatot(_ sender: UIButton)
    {
        if btnSpecialShabbatot.tag == 106
        {
            btnSpecialShabbatot.tag = 206
            btnSpecialShabbatot.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnSpecialShabbatot.tag = 106
            btnSpecialShabbatot.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    
    @IBAction func btnModernHolidays(_ sender: UIButton)
    {
        if btnModernHolidays.tag == 107
        {
            btnModernHolidays.tag = 207
            btnModernHolidays.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnModernHolidays.tag = 107
            btnModernHolidays.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    @IBAction func btnCustomHolidays(_ sender: UIButton)
    {
        if btnCustomRepeatedEvents.tag == 108
        {
            loadCustomEvents()
            btnCustomRepeatedEvents.tag = 208
            btnCustomRepeatedEvents.setImage(UIImage(named: "Calender_select"), for: .normal)
        }
        else
        {
            btnCustomRepeatedEvents.tag = 108
            btnCustomRepeatedEvents.setImage(UIImage(named: "Calender_Unselect"), for: .normal)
        }
    }
    
    
    
    func loadMajorHoliday()
    {
        if let path = Bundle.main.url(forResource: "Major_Holidays", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrMajorHoliday = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    func loadCustomEvents()
    {
        if UserDefaults.standard.object(forKey: "CustomLst") != nil
        {
            let userdefaults = UserDefaults.standard
            arrCustomEventList = userdefaults.array(forKey: "CustomLst")! as NSArray
        }
    }
    
    
    @IBAction func SyncData(_ sender: UIButton)
    {
            if btnMajorHoliday.tag == 201 || btnMinorHoliday.tag == 202 || btnRoshHoliday.tag == 203 || btnWeeklyHoliday.tag == 204 || btnOmerHoliday.tag == 205 || btnSpecialShabbatot.tag == 206 || btnModernHolidays.tag == 207 || btnCustomRepeatedEvents.tag == 208
            {
                let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                hud.label.text = "Dowloading events to device calender"
                EventManager.shared.fetchEvents( year: EventManager.shared.currentYear(), { _ in
                    self.actionAddEvent();
                })
            }
            else
            {
                showAlert("Please select any one of the option to download the envents to your calender.")
                return;
            }
        }
    
    
    
    
    func checkCalendarAuthorizationStatus()
    {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status)
        {
        case EKAuthorizationStatus.notDetermined:
            // This happens on first-run
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            // Things are in line with being able to show the calendars in the table view
            loadCalendars()
        //            refreshTableView()
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied: break
            // We need to help them give us permission
            //            needPermissionView.fadeIn()
        }
    }
    
    func requestAccessToCalendar()
    {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                DispatchQueue.main.async(execute: {
                    self.loadCalendars()
                    //                    self.refreshTableView()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    //                    self.needPermissionView.fadeIn()
                })
            }
        })
    }
    
    func loadCalendars()
    {
        self.calendars = eventStore.calendars(for: EKEntityType.event)
    }
    
    func actionAddEvent()
    {
        var itemsToAddInCalender = [RLEvent] ()
        
        let events = EventManager.shared.events
        
        if self.btnMajorHoliday.tag == 201 {
            itemsToAddInCalender = events.filter({ (event) -> Bool in
                if let cat = event.category, let subcat = event.subcat {
                    if cat == "holiday" && subcat == "major" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnMinorHoliday.tag == 202 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                if let cat = event.category, let subcat = event.subcat {
                    if cat == "holiday" && subcat == "minor" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnRoshHoliday.tag == 203 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                if let cat = event.category{
                    if cat == "roshchodesh" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnWeeklyHoliday.tag == 204 {
            //TODO: Need to work on this
        }
        
        if self.btnOmerHoliday.tag == 205 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                if let cat = event.category {
                    if cat == "omer" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnSpecialShabbatot.tag == 206 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                if let cat = event.category {
                    if cat == "shabbat" {
                        return true
                    }
                }
                return false
            })        }
        
        if self.btnModernHolidays.tag == 207 {
            
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                if let cat = event.category, let subcat = event.subcat {
                    if cat == "holiday" && subcat == "modern" {
                        return true
                    }
                }
                return false
            })        }
        
        if self.btnCustomRepeatedEvents.tag == 208 {
            
            var customEvents = [RLEvent]()
            for dict in arrCustomEventList {
                let event = RLEvent.init(dictionary: dict as! NSDictionary)
                customEvents.append(event!)
            }
             itemsToAddInCalender = itemsToAddInCalender + customEvents
        }
        
        syncWithCalender(itemsToAddInCalender: itemsToAddInCalender)
    }
    
    
    func syncWithCalender(itemsToAddInCalender: [RLEvent]) {
        
        var txtStartDate = String()
        var txtEventName = String()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var strGetEventTitle = String()
        var strGetEventDate = Date()
        
        
        
        DispatchQueue.global(qos: .background).async {
            
            for dicc in itemsToAddInCalender {
                
                txtEventName = dicc.title ?? ""
                txtStartDate = dicc.date ?? ""
                
                let datevalue = dateFormatter.date(from: txtStartDate)?.addingTimeInterval(60*60*24)
                let datevalue1 = dateFormatter.date(from: txtStartDate)?.addingTimeInterval(60*60*24*2)
                
                let predicate = self.eventStore.predicateForEvents(withStart: datevalue!, end: datevalue1!, calendars: self.calendars)
                let events = self.eventStore.events(matching: predicate) as [EKEvent]
                
                print("Events: \(events)")
                for event in events
                {   event.isAllDay = true
                    strGetEventTitle = event.title;
                    strGetEventDate = event.startDate;
                }
                if strGetEventTitle == "txtEventName" && strGetEventDate == datevalue
                {
                    
                }
                else
                {
                    let event:EKEvent = EKEvent(eventStore: self.eventStore)
                    event.title = txtEventName
                    event.isAllDay = true
                    event.startDate = datevalue!
                    event.endDate = datevalue1!
                    if let description = dicc.memo {
                        event.notes = description
                    }
                    event.calendar = self.eventStore.defaultCalendarForNewEvents
                    do {
                        try self.eventStore.save(event, span: .thisEvent)
                    }
                    catch let e as NSError
                    {
                        print("calendar sync error")
                        print(e.description)
                        return
                    }
                }
            }
            
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    
    @IBAction func btnAddCustomEvent(_ sender: UIButton)
    {
        UserDefaults.standard.set("", forKey: "Conv_Date")
        UserDefaults.standard.set("", forKey: "Conv_Month")
        UserDefaults.standard.set("", forKey: "Conv_Year")
        UserDefaults.standard.set("", forKey: "Conv_SunSet")
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let settingViewController: NewAddCustomEventsVC = mainStoryboard.instantiateViewController(withIdentifier: "NewAddCustomEventsVC") as! NewAddCustomEventsVC
        
        self .present(settingViewController, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCustomEventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "EventListCell"
        
        let cell: EventListCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? EventListCell
        cell.backgroundColor = UIColor.clear
        
        let dicc = arrCustomEventList[indexPath.row] as! [String : Any]
        
        cell.lblTitle.text = String (describing: dicc["eventTitle"]!)
        cell.btnCross.tag = indexPath.row
        cell.btnCross.setImage(UIImage(named: "cross") , for: UIControlState.normal)
        cell.btnCross.isUserInteractionEnabled = true
        //        cell.btnCross.isHidden = true;
        cell.isUserInteractionEnabled = true
        
        cell.btnCross.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40;//Choose your custom row height
    }
    
    func pressButton(_ button: UIButton)
    {
        
        let objCMutableArray = NSMutableArray(array: arrCustomEventList)
        objCMutableArray.removeObject(at: button.tag)
        arrCustomEventList = (objCMutableArray as NSArray)
        
        UserDefaults.standard.set(arrCustomEventList, forKey: "CustomLst")
        
        if arrCustomEventList.count > 0
        {
            tblView.isHidden = false
        }
        else
        {
            tblView.isHidden = true
        }
        
        tblView.reloadData()
    }
}





