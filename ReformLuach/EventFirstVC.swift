//
//  EventFirstVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 10/3/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation
import CSV
import SwiftyJSON


class EventFirstVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    //    var GLClass: GLViewPagerViewController
    //    var myEventViewMain = Event()
    
    var myNavController: UINavigationController?
    
    var arrHolidays = NSArray()
    
    var arrTotalHolidays = NSArray()
    
    var omerDays = NSArray()
    
    var readRoshChodush = NSArray()
    
    var roshChodush = NSArray()
    
    var omerRoshChodush = NSArray()
    
    var parshita = NSArray()
    
    var allArray = NSArray()
    
    
    
    var  data:[[String:String]] = []
    var  columnTitles:[String] = []
    @IBOutlet internal var tblParshiyot: UITableView!
    //    var presentLabel: UILabel = UILabel()
    //    @IBOutlet var tblEvent: UITableView!
    
    
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    
    
    //    init(title : NSString) {
    //        _title = title
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //       // fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad()
        
    {
        
        super.viewDidLoad()
        
        readDataFromPersita()
        
//        addRoshChodush()
        
      //  addOmerDays()
        
     //   readDataFromFile()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextFirst(notification:)), name: Notification.Name("NotificationTextFirst"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearFirst(notification:)), name: Notification.Name("NotificationClearFirst"), object: nil)

        
    }
    
    @objc func filterTextFirst(notification: Notification)
    {
        let str = notification.object
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
      arrHolidays = (allArray as NSArray).filtered(using: predicate) as NSArray
        
        self.tblParshiyot.reloadData()
    }
    
    
    @objc func filterClearFirst(notification: Notification)
    {
        let str = notification.object
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
            arrHolidays = allArray as NSArray
            self.tblParshiyot.reloadData()
    }
    
 
//    @objc func filterTextSecond(notification: Notification)
//
//    {
//
//        let str = notification.object
//
//        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
//
//        arrHolidays = (allArray as NSArray).filtered(using: predicate) as NSArray
//
//
//
//        tblParshiyot.reloadData()
//
//    }
//
//
//
//    @objc func filterClearSecond(notification: Notification)
//
//    {
//
//        var str = notification.object
//
//        arrHolidays = (allArray as NSArray)
//
//        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
//
//        tblParshiyot.reloadData()
//
//    }
//
    override func viewWillAppear(_ animated: Bool) {
      //  readDataFromFile()
        super.viewWillAppear(true)
      NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        arrHolidays = allArray as NSArray
        self.tblParshiyot.reloadData()
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //MARK: step 5 create a reference of Class B and bind them through the prepareforsegue method
        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? GLViewPagerViewController
        {
            classBVC.delegate = self as? GLViewPagerViewControllerDelegate
        }
        
    }
    
    override func viewWillLayoutSubviews()
    {
       self.tblParshiyot.reloadData()
        
    }
  
    func readDataFromPersita() {
        
        let btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")! as String
        
        if btnTagValue == "DIASPORA"
            
        {
            
            if let path = Bundle.main.url(forResource: "torah-diaspora", withExtension: "json")
                
            {
                
                do {
                    
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    
                    
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                        
                        let person = jsonResult["result"] as? [Any]
                        
                    {
                        
                        parshita = person as NSArray
                        addRoshChodush()

                        
                    }
                    
                } catch {
                    
                    // handle error
                    
                }
                
            }
            
        }
            
        else
            
        {
            
            if let path = Bundle.main.url(forResource: "torah-israel", withExtension: "json")
                
            {
                
                do {
                    
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                   if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                        
                        let person = jsonResult["result"] as? [Any]
                        
                    {
                        parshita = person as NSArray
                        addRoshChodush()

                    }
                    
                } catch {
                    
                    // handle error
                    
                }
            }
        }
    }
    
    func addRoshChodush(){
        
        if let path = Bundle.main.url(forResource: "Rosh_Chodush_Israel", withExtension: "json")
            
        {
            
            do {
                
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    
                    let person = jsonResult["result"] as? [Any]
                    
                {
                    
                    roshChodush =  person as NSArray
                    
                    readRoshChodush = roshChodush.addingObjects(from: parshita as! [Any]) as NSArray
                     addOmerDays()
                    
                    
                }
                
            } catch {
                
                // handle error
                
            }
            
        }
        
    }
    
    func addOmerDays(){
        
        if let path = Bundle.main.url(forResource: "DaysOfOmer", withExtension: "json"){
            
            do {
                
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    
                let person = jsonResult["result"] as? [AnyObject]
                    
                {
                    var subArray = [String]()
                    var daysArray = [[String:Any]]()
                    subArray.removeAll()
                    let decimalCharacters = CharacterSet.decimalDigits
                    for per in person {
                       let sub = per["Subject"] as? String
                        let subject = sub?.prefix(2)
                        let decimalRange = subject?.rangeOfCharacter(from: decimalCharacters)
                            if decimalRange != nil {
                                subArray.append(sub!)
                                daysArray.append(per as! [String : Any])
                            }
                        }
                   // arrHolidays = subArray as NSArray
                    self.tblParshiyot.reloadData()
                    omerRoshChodush = daysArray as NSArray
                    omerDays = omerRoshChodush.addingObjects(from: readRoshChodush as! [Any]) as NSArray
          //          print(omerDays)
                    readDataFromFile()
                }
                
            } catch {
                
                // handle error
                
            }
            
        }
        
    }
    
    func readDataFromFile()
        
    {
    let btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")! as String
        
        if btnTagValue == "DIASPORA"
            
        {
            
            if let path = Bundle.main.url(forResource: "Jewish_holiday", withExtension: "json")
                
            {
                
                do {
                    
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    
                    
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                        
                        let person = jsonResult["result"] as? [Any]
                        
                    {
                        
                        arrHolidays = person as NSArray
                        
                        arrTotalHolidays = person as NSArray
                        
                        arrHolidays = arrTotalHolidays.addingObjects(from: (omerDays as NSArray) as! [Any]) as NSArray
                        
                        allArray = arrHolidays
                        
                        
                        
                        
                        
                        //  arrHolidays = arrHolidays.addingObjects(from: readRoshChodush as! [Any]) as NSArray
                        
                        
                        
                        print(arrHolidays.count)
                        
                        tblParshiyot.reloadData()
                        
                    }
                    
                } catch {
                    
                    // handle error
                    
                }
                
            }
            
        }
            
        else
            
        {
            
            if let path = Bundle.main.url(forResource: "Jewish_holiday_Israel", withExtension: "json")
                
            {
                
                do {
                    
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    
                    
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                        
                        let person = jsonResult["result"] as? [Any]
                        
                    {
                        
                        arrHolidays = person as NSArray
                        
                        arrTotalHolidays = person as NSArray
                        
                        arrHolidays = arrTotalHolidays.addingObjects(from: (omerDays as NSArray) as! [Any]) as NSArray
                        
                        allArray = arrHolidays
                        
                        tblParshiyot.reloadData()
                        
                    }
                    
                } catch {
                    
                    // handle error
                    
                }
                
            }
            
        }
        
        
        
        //        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        
        for i in 0..<allArray.count
            
        {
            
            let dicc = arrHolidays[i] as! [String : Any]
            
            let myEventDate = String (describing: dicc["Start_Date"]!)
            
            let dateFormatter1 = DateFormatter()
            
            dateFormatter1.dateFormat = "MM/dd/yyyy"
            
            let dates = dateFormatter1.date(from: myEventDate)
            
            let currentDate = NSDate()
            
            
            
            
            
            // Using granularity of .minute
            let order = Calendar.current.compare(currentDate as Date, to: dates!, toGranularity: .minute)
            
            switch order {
            case .orderedAscending:
                tblParshiyot.scrollToRow(at: IndexPath(row: i, section: 0), at: .top, animated: true)
                return;
            case .orderedDescending:
                print("\(currentDate) is before \(dates) indecx path \(i)")
            default:
                tblParshiyot.scrollToRow(at: IndexPath(row: i, section: 0), at: .top, animated: true)
                print("\(currentDate) is the same as \(dates) indecx path \(i)")
                return;
            }
        }
        
    }
    //    Mark -- Tableview
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return arrHolidays.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? customCell
        
        let dicc = arrHolidays[indexPath.row] as? [String : Any]
        
        cell?.lblEvntTitle.text = String (describing: dicc!["Subject"]!)
        
        cell?.lblEvntDate.text = String (describing: dicc!["Start_Date"]!)
        
        return cell!
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    {
        
        let dicc = arrHolidays[indexPath.row] as! [String : Any]
        

    //    tblParshiyot.isHidden = true;
    let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)

        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC

        vc.eventType = "ALL"

        vc.eventName = String (describing: dicc["Subject"]!)

        self.present(vc, animated: false, completion: nil)

    }
}







