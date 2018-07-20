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
        if syncType.syncState == .selected {
            syncType.syncState = .none
        } else {
            syncType.syncState = .selected
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
        for dataSource in dataSources {
            for type in dataSource.syncTypes {
                if type.syncState == .selected {
                    type.eventStore = self.eventStore
                    type.calendars = self.calendars
                    type.syncState = .inProgress
                    self.tableView.reloadData()
                    type.sync({ completed in
                        self.tableView.reloadData()
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
                })
            }
        })
    }
    
    func loadCalendars() {
        self.calendars = eventStore.calendars(for: EKEntityType.event)
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
}
