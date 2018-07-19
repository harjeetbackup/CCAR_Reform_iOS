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

let kSyncDataSourceKey = "kSyncDataSourceKey"

class CalenderSyncVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var HeaderImage: UIImageView!
    @IBOutlet var yearDisplaySegmentedControl: UISegmentedControl!
    var selectedYearIndex = 0
    var dataSources = [SyncDataSouce]()
    
    var event: EKEvent!
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    var eventDetailsArray = [AnyHashable]()
    var syncedYear = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        event = EKEvent(eventStore: eventStore)
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        yearDisplaySegmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        configYearSegmentedControl()
        loadSavedSyncDataSources()
        NotificationCenter.default.addObserver(self, selector: #selector(saveDataSources), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    
    func loadSavedSyncDataSources() {
        guard let decoded  = UserDefaults.standard.object(forKey: kSyncDataSourceKey) as? Data else { return }
        guard let dataSourcesItems = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [SyncDataSouce] else { return }
        dataSources = dataSourcesItems
        tableView.reloadData()
    }
    
    func configYearSegmentedControl() {
        let date = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date)
        
        guard let url = Bundle.main.url(forResource: "SyncType", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let syncTypes = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:String]] else { return }
        
        for count in 0...3 {
            let year = "\(currentYear + count)"
            yearDisplaySegmentedControl.setTitle(year, forSegmentAt: count)
            let source = SyncDataSouce()
            source.year = year
            guard let types = syncTypes else { return }
            for type in types {
                source.syncTypes.append(SyncType(dict: type, source: source))
            }
            dataSources.append(source)
        }
        tableView.reloadData()
    }
    
    func selectionDidChange(_ sender: UISegmentedControl) {
        selectedYearIndex = yearDisplaySegmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = dataSources[selectedYearIndex]
        return dataSource.syncTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalenderSyncTypeCell", for: indexPath) as! CalenderSyncTypeCell
        let dataSource = dataSources[selectedYearIndex]
        cell.syncType = dataSource.syncTypes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let dataSource = dataSources[selectedYearIndex]
        let syncType = dataSource.syncTypes[indexPath.row]
        return syncType.syncState != .completed
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataSource = dataSources[selectedYearIndex]
        let syncType = dataSource.syncTypes[indexPath.row]
        if syncType.syncState == .progress {
            syncType.syncState = .none
        } else {
            syncType.syncState = .progress
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
    }
    
    func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkCalendarAuthorizationStatus()
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        saveDataSources()
    }
    
    func myBackGraound(strmonth: NSInteger) {
        let strimagename = "Sync_Header" + "\(strmonth)"
        HeaderImage .image = UIImage(named: strimagename)
    }

    
    @IBAction func SyncData(_ sender: UIButton) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Dowloading events to device calender"
        for dataSource in dataSources {
            for type in dataSource.syncTypes {
                if type.syncState == .progress {
                    if syncedYear.contains(dataSource.year) == false {
                        syncedYear.append(dataSource.year)
                    }
                    type.eventToSync(selectedYears: syncedYear, { [weak self] (events) in
                        self?.syncWithCalender(itemsToAddInCalender: events, forType: type)
                    })
                }
            }
        }
        tableView.reloadData()
    }
    
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        switch (status) {
        case EKAuthorizationStatus.notDetermined:
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            loadCalendars()
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied: break
        }
    }
    
    func requestAccessToCalendar() {
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
    
    func loadCalendars() {
        self.calendars = eventStore.calendars(for: EKEntityType.event)
    }
    
    
    func syncWithCalender(itemsToAddInCalender: [RLEvent], forType: SyncType) {
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
                txtEventName = txtEventName.spellChangedForTitle()
                guard let datevalue = dateFormatter.date(from: txtStartDate),
                    let datevalue1 = dateFormatter.date(from: txtStartDate) else {
                        continue
                }
                let predicate = self.eventStore.predicateForEvents(withStart: datevalue, end: datevalue1, calendars: self.calendars)
                let events = self.eventStore.events(matching: predicate) as [EKEvent]
                print("Events: \(events)")
                for event in events
                {   event.isAllDay = true
                    strGetEventTitle = event.title;
                    strGetEventDate = event.startDate;
                }
                if strGetEventTitle == "txtEventName" && strGetEventDate == datevalue {
                } else {
                    let event:EKEvent = EKEvent(eventStore: self.eventStore)
                    event.title = txtEventName
                    event.isAllDay = true
                    event.startDate = datevalue
                    event.endDate = datevalue1
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
                forType.syncState = .completed
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    
    deinit {
        saveDataSources()
    }
    
    func saveDataSources() {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: dataSources)
        userDefaults.set(encodedData, forKey: kSyncDataSourceKey)
        userDefaults.synchronize()
    }
    
    
    
    /*
    
    func actionAddEvent() {
        var itemsToAddInCalender = [RLEvent] ()
        let events = EventManager.shared.events
        
        if self.btnMajorHoliday.tag == 201 {
            itemsToAddInCalender = events.filter({ (event) -> Bool in
                print(event.category)
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
                print(event.category)
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
                print(event.category)
                if let cat = event.category{
                    if cat == "roshchodesh" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnWeeklyHoliday.tag == 204 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                print(event.category)
                if let cat = event.category {
                    if cat == "parashat" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnOmerHoliday.tag == 205 {
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                print(event.category)
                if let cat = event.category {
                    if cat == "omer" {
                        return true
                    }
                }
                return false
            })
        }
        
        if self.btnSpecialShabbatot.tag == 206 {
            // Todo: added shabbat as subcat
            itemsToAddInCalender = itemsToAddInCalender + events.filter({ (event) -> Bool in
                print(event.category)
                if let cat = event.category, let subcat = event.subcat {
                    if cat == "holiday" && subcat == "shabbat" {
                        return true
                    }
                }
                return false
            })
        }
        
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

    
    @IBAction func btnAddCustomEvent(_ sender: UIButton) {
        UserDefaults.standard.set("", forKey: "Conv_Date")
        UserDefaults.standard.set("", forKey: "Conv_Month")
        UserDefaults.standard.set("", forKey: "Conv_Year")
        UserDefaults.standard.set("", forKey: "Conv_SunSet")
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let settingViewController: NewAddCustomEventsVC = mainStoryboard.instantiateViewController(withIdentifier: "NewAddCustomEventsVC") as! NewAddCustomEventsVC
        self .present(settingViewController, animated: true, completion: nil)
    }
    
    func pressButton(_ button: UIButton) {
        let objCMutableArray = NSMutableArray(array: arrCustomEventList)
        objCMutableArray.removeObject(at: button.tag)
        arrCustomEventList = (objCMutableArray as NSArray)
        UserDefaults.standard.set(arrCustomEventList, forKey: "CustomLst")
        if arrCustomEventList.count > 0 {
            tblView.isHidden = false
        } else {
            tblView.isHidden = true
        }
        tblView.reloadData()
    }
    */
}
