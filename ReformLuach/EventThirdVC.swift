//
//  EventThirdVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 10/3/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EventThirdVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet internal var tblParshiyot: UITableView!
    //    var presentLabel: UILabel = UILabel()
    var myNavController: UINavigationController?
    //    var myEventViewMain = Event()
    
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    var strDate: NSInteger!
    var strMonth: NSInteger!
    var strYear: NSInteger!
    
    var arrHolidays = NSArray()
    
    var arrTotalHolidays = NSArray()
    
    var omerDays = NSArray()
    
    var readRoshChodush = NSArray()
    
    var omerRoshChodush = NSArray()
    var allArray = NSArray()

    
    
    
    
    
    override func viewDidLoad()
        
    {
        
        super.viewDidLoad()
        addRoshChodush()
        
//        addOmerDays()
        
      //  readDataFromFile()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextThird(notification:)), name: Notification.Name("NotificationTextThird"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearThird(notification:)), name: Notification.Name("NotificationClearThird"), object: nil)
        
        
        
    }
    
    @objc func filterTextThird(notification: Notification)
    {
        let str = notification.object
        
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
        
        arrHolidays = (allArray as NSArray).filtered(using: predicate) as NSArray
        
        tblParshiyot.reloadData()
        
    }
    
    
    @objc func filterClearThird(notification: Notification)
    {
        var str = notification.object
        
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        
        arrHolidays = (allArray as NSArray)

        tblParshiyot.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        //  readDataFromFile()
        super.viewWillAppear(true)
        arrHolidays = (allArray as NSArray)
       // NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
  
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMMM dd, yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        //        lblFulldate?.text = myStringafd;
        let date = Date()
        let calendar = Calendar.current
        strYear = calendar.component(.year, from: date)
        strMonth = calendar.component(.month, from: date)
        strDate = calendar.component(.day, from: date)
        arrHolidays = (allArray as NSArray)
        self.tblParshiyot.reloadData()
//        readDataFromFile()
     NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        //        loaddata()
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
                    
                    readRoshChodush = person as NSArray
                    addOmerDays()
                   // tblParshiyot.reloadData()
                    
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
                    print(omerDays)
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
        
        
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        
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
                print("\(currentDate) is before \(String(describing: dates)) indecx path \(i)")
            default:
                tblParshiyot.scrollToRow(at: IndexPath(row: i, section: 0), at: .top, animated: true)
                return;
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    //    Mark -- Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrHolidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? customCell
        let dicc = arrHolidays[indexPath.row] as! [String: Any]
        cell?.lblEvntTitle.text = String (describing: dicc["Subject"]!)
        cell?.lblEvntDate.text = String (describing: dicc["Start_Date"]!)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dicc = arrHolidays[indexPath.row] as! [String : Any]
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC

        self.present(vc, animated: false, completion: nil)
    }
}


