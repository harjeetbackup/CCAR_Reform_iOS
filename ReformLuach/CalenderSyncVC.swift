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


//import AddCustomEvent


//class CalenderSyncVC: UIViewController, UITableViewDelegate, UITableViewDataSource
class CalenderSyncVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
//    @IBOutlet weak var CalendarType: UITableView!
    @IBOutlet weak var btnSwitch: UISwitch!
    
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
//    var tblView: UITableView!
    
    @IBOutlet weak var srrlView: UIScrollView?
    
    @IBOutlet weak var view_WidthCons: NSLayoutConstraint!
    
    
    @IBOutlet weak var HeaderImage: UIImageView!
//    @IBOutlet weak var localSyncView: UIView!
//    @IBOutlet weak var exportView: UIView!
//     @IBOutlet weak var settingView: UIView!
    var event: EKEvent!
//    var isAccessToEventStoreGranted = false
//    var eventStore: EKEventStore?
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    
    var eventDetailsArray = [AnyHashable]()
//    var calendar = Calendar.self;
    
    var arrMajorHoliday = NSArray()
    var arrMinorHoliday = NSArray()
    var arrRoshChodesh = NSArray()
    var arrWeeklyParshiyot = NSArray()
    var arrOmerHoliday = NSArray()
    var arrSpecialShabbatot = NSArray()
    var arrModernHolidays = NSArray()
    var arrCustomEventList = NSArray()

//    var names = ["Major Holiday","Minor Holiday","Rosh Chodesh","Weekly Parshiyot","Sefirat Ha'Omer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        btnSwitch .setOn(false, animated: true)
//       CalendarType.isHidden = true;
    
        event = EKEvent(eventStore: eventStore)

        
        btnSwitch?.layer.cornerRadius = (btnSwitch?.frame.size.height)!/2;
        btnSwitch?.layer.borderColor = UIColor.white.cgColor;
        btnSwitch?.layer.borderWidth = 1;
        btnSwitch?.layer.masksToBounds = true;
        
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
        
//        tblView.frame = CGRect(x: 0, y: btnCustomRepeatedEvents.frame.origin.y + btnCustomRepeatedEvents.frame.size.height + 1, width: buttonView.frame.size.width, height: 180)
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
        
        
//        buttonView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 520)
        
        
        
        
        
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
            loadMinorHoliday()
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
            loadRoshHoliday()
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
            loadWeeklyHoliday()
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
            loadOmerHoliday()
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
            loadSpecialShabbatot()
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
            loadModernHolidays()
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
    
    func loadMinorHoliday()
    {
        
        if let path = Bundle.main.url(forResource: "Majer_miner", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrMinorHoliday = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    func loadRoshHoliday()
    {
        
        if let path = Bundle.main.url(forResource: "Rosh_Chodush", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrRoshChodesh = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    
    
    func loadWeeklyHoliday()
    {
        
        if let path = Bundle.main.url(forResource: "Weakly_parshiyor", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrWeeklyParshiyot = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    func loadOmerHoliday()
    {
        
        if let path = Bundle.main.url(forResource: "DaysOfOmer", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrOmerHoliday = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    
    func loadSpecialShabbatot()
    {
        
        if let path = Bundle.main.url(forResource: "Special_Shabbatot", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrSpecialShabbatot = person as NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    
    func loadModernHolidays()
    {
        
        if let path = Bundle.main.url(forResource: "Morder_Holiday", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["result"] as? [Any]
                {
                    arrModernHolidays = person as NSArray
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
    
    
    
    @IBAction func SyncData(_ sender: UISwitch)
    {
        if btnSwitch .isOn
        {
            
           
            if btnMajorHoliday.tag == 201 || btnMinorHoliday.tag == 202 || btnRoshHoliday.tag == 203 || btnWeeklyHoliday.tag == 204 || btnOmerHoliday.tag == 205 || btnSpecialShabbatot.tag == 206 || btnModernHolidays.tag == 207 || btnCustomRepeatedEvents.tag == 208
            {
               btnSwitch .setOn(true, animated: true)
              self.view.makeToast("Please wait, syncing Calender", duration: 2.0, position: .center, title: "", image: nil, style:.init(), completion: nil)
                actionAddEvent();
            }
            else
            {
                let alert = UIAlertView()
                //            alert.title = ""
                alert.message = "Please select any one option"
                alert.addButton(withTitle: "OK")
                alert.show()
                btnSwitch .setOn(false, animated: true)
                return;
            }
        }
        else
        {
            
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
        var itemsToAddInCalender = [[String : Any]] ()
                
                if self.btnMajorHoliday.tag == 201 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrMajorHoliday as! [[String : Any]]);
                }
                
                if self.btnMinorHoliday.tag == 202 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrMinorHoliday as! [[String : Any]]);
                }
                
                if self.btnRoshHoliday.tag == 203 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrRoshChodesh as! [[String : Any]]);
                }
                
                if self.btnWeeklyHoliday.tag == 204 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrWeeklyParshiyot as! [[String : Any]]);
                }
                
                if self.btnOmerHoliday.tag == 205 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrOmerHoliday as! [[String : Any]]);
                }
        
                if self.btnSpecialShabbatot.tag == 206 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrSpecialShabbatot as! [[String : Any]]);
                }
                
                if self.btnModernHolidays.tag == 207 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrModernHolidays as! [[String : Any]]);
                }
        
                if self.btnCustomRepeatedEvents.tag == 208 {
                    itemsToAddInCalender = itemsToAddInCalender + (self.arrCustomEventList as! [[String : Any]]);
                }
    
            syncWithCalender(itemsToAddInCalender: itemsToAddInCalender)
    }
    
    
    func syncWithCalender(itemsToAddInCalender: [[String: Any]]) {
        
        var txtStartDate = String()
        var txtEventName = String()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        var strGetEventTitle = String()
        var strGetEventDate = Date()
        
        DispatchQueue.global(qos: .background).async {
        
                for dicc in itemsToAddInCalender {
                    
                    txtEventName = String (describing: dicc["Subject"]!)
                    txtStartDate = String (describing: dicc["Start Date"]!)
                    let datevalue = dateFormatter.date(from: txtStartDate)
                    let datevalue1 = dateFormatter.date(from: txtStartDate)?.addingTimeInterval(60*60*24)
                    
                    let predicate = self.eventStore.predicateForEvents(withStart: datevalue!, end: datevalue1!, calendars: self.calendars)
                    let events = self.eventStore.events(matching: predicate) as [EKEvent]
    
                    print("Events: \(events)")
                    for event in events
                    {   event.isAllDay = true
                        strGetEventTitle = event.title;
                        strGetEventDate = event.startDate;
                    }
                    if strGetEventTitle == txtEventName && strGetEventDate == datevalue
                    {
                        
                    }
                    else
                    {
                        let event:EKEvent = EKEvent(eventStore: self.eventStore)
                        event.title = txtEventName
                        event.isAllDay = true
                        event.startDate = datevalue!
                        event.endDate = datevalue1!
                        if let description = dicc["Description"] as? String {
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
 
        var objCMutableArray = NSMutableArray(array: arrCustomEventList)
//        objCMutableArray.removeObjects(at: sender.tag)
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

class EventListCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCross: UIButton!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}



