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
    
    @IBOutlet var eventsSyncButton: UIButton!
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var HeaderImage: UIImageView!
    @IBOutlet var yearDisplaySegmentedControl: UISegmentedControl!
    @IBOutlet var calenderTypeButton: UIButton!
    @IBOutlet var calenderTypeIndicator: UILabel!
    var selectedYearIndex = 0
    var calenders = [String: [SyncDataSouce]]()
    var event: EKEvent!
    let eventStore = EKEventStore()
    var ekCalendar: [EKCalendar]?
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
        calenderTypeIndicator.text = calTypeName
        yearDisplaySegmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        eventsSyncButton.clipsToBounds = true
        eventsSyncButton.layer.cornerRadius = 4
        let spacing = 10
        eventsSyncButton.imageEdgeInsets =
            UIEdgeInsets.init(top: 2, left: 114, bottom: 2, right: CGFloat(spacing))
        eventsSyncButton.titleEdgeInsets =
            UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 50)
        configYearSegmentedControl()
        loadSavedSyncDataSources()
        NotificationCenter.default.addObserver(self, selector: #selector(saveDataSources), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    func loadSavedSyncDataSources() {
        guard let decoded  = UserDefaults.standard.object(forKey: kSyncDataSourceKey) as? Data else { return }
        guard let cals = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [String: [SyncDataSouce]] else { return }
        calenders = cals
        tableView.reloadData()
    }
    
    func configYearSegmentedControl() {
        let date = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date)
        guard let url = Bundle.main.url(forResource: "SyncType", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let syncTypes = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:String]] else { return }
        let calTypes: [CalenderType] = [.israel, .reform, .dispora]
        for calType in calTypes {
            var years = [SyncDataSouce]()
            for count in 0...3 {
                let year = "\(currentYear + count)"
                yearDisplaySegmentedControl.setTitle(year, forSegmentAt: count)
                let source = SyncDataSouce()
                source.year = year
                for type in syncTypes {
                    source.syncTypes.append(SyncType(dict: type, source: source))
                }
                years.append(source)
            }
            calenders[calType.rawValue] = years
        }
        tableView.reloadData()
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        selectedYearIndex = yearDisplaySegmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let years = calenders[EventManager.shared.selectedCalender.rawValue]
        let year = years![selectedYearIndex]
        return year.syncTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalenderSyncTypeCell", for: indexPath) as! CalenderSyncTypeCell
        let years = calenders[EventManager.shared.selectedCalender.rawValue]
        let year = years![selectedYearIndex]
        cell.syncType = year.syncTypes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let years = calenders[EventManager.shared.selectedCalender.rawValue]
        let year = years![selectedYearIndex]
        let syncType = year.syncTypes[indexPath.row]
        return syncType.syncState != .completed
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let years = calenders[EventManager.shared.selectedCalender.rawValue]
        let year = years![selectedYearIndex]
        let syncType = year.syncTypes[indexPath.row]
        if syncType.syncState == .selected {
            syncType.syncState = .none
        } else {
            syncType.syncState = .selected
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    @objc func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
    }
    
    @objc func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calenderTypeIndicator.text = calTypeName
        checkCalendarAuthorizationStatus()
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        saveDataSources()
    }
    
    func myBackGraound(strmonth: NSInteger) {
        let strimagename = "Sync_Header" + "\(strmonth)"
        HeaderImage .image = UIImage(named: strimagename)
    }
    
    @IBAction func calenderTypeButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let settingViewController: SettingVC = mainStoryboard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.present(settingViewController, animated: true, completion: nil)
    }
    
    @IBAction func SyncData(_ sender: UIButton) {
        let year = calenders[EventManager.shared.selectedCalender.rawValue]
        for dataSource in year! {
            for type in dataSource.syncTypes {
                if type.syncState == .selected {
                    type.eventStore = self.eventStore
                    type.calendars = self.ekCalendar
                    type.syncState = .inProgress
                    self.tableView.reloadData()
                    type.sync({ [weak self] completed in
                        //if completed == true {
                        self?.tableView.reloadData()
                        //}
                        //                        else {
                        //                          self?.showAlert("Sorry, Something went wrong!", message: "Please try again after sometime")
                        //                        }
                    })
                }
            }
        }
        tableView.reloadData()
    }
    
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        switch status {
        case EKAuthorizationStatus.notDetermined:
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            loadCalendars()
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied: break
        @unknown default:
            break
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
        self.ekCalendar = eventStore.calendars(for: EKEntityType.event)
    }
    
    deinit {
        saveDataSources()
    }
    
    @objc func saveDataSources() {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: calenders)
        userDefaults.set(encodedData, forKey: kSyncDataSourceKey)
        userDefaults.synchronize()
    }
}
