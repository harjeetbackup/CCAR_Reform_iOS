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

class EventSecondVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    //    var GLClass: GLViewPagerViewController
    //    var myEventViewMain = Event()
    
    var myNavController: UINavigationController?
    var arrParshita = NSArray()
    var arrTotalParshita = NSArray()
    
    
    var  data:[[String:String]] = []
    var  columnTitles:[String] = []
    @IBOutlet internal var tblParshiyot: UITableView!
    //    var presentLabel: UILabel = UILabel()
    //    @IBOutlet var tblEvent: UITableView!
    
    
    internal var _title : NSString = "Page Zero"
    internal var _setupSubViews:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        readDataFromFile()
       
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterTextSecond(notification:)), name: Notification.Name("NotificationTextSecond"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.filterClearSecond(notification:)), name: Notification.Name("NotificationClearSecond"), object: nil)
    
    }
    
    @objc func filterTextSecond(notification: Notification)
    {
        let str = notification.object
    
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", str as! CVarArg)
                arrParshita = (arrTotalParshita as NSArray).filtered(using: predicate) as NSArray
        
        tblParshiyot.reloadData()
    }
    
    
    @objc func filterClearSecond(notification: Notification)
    {
        let str = notification.object
        NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        arrParshita = (arrTotalParshita as NSArray)
        tblParshiyot.reloadData()
    }

    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
      NotificationCenter.default.post(name: Notification.Name("NotificationClearSearcBar"), object:nil)
        arrParshita = (arrTotalParshita as NSArray)
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
        //                readDataFromFile()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    Mark -- Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return arrParshita.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        
        //        cell.lblEvntTitle.text = Holi[indexPath.row]
        //        cell.lblEvntDate.text = Year[indexPath.row]
        let dicc = arrParshita[indexPath.row] as! [String : Any]
        
        cell.lblEvntTitle.text = String (describing: dicc["Subject"]!)
        cell.lblEvntDate.text = String (describing: dicc["Start_Date"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dicc = arrParshita[indexPath.row] as! [String : Any]
        
        //        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        //        let vc = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        //
        //        vc?.eventType = "PARSHIYOT"
        //        vc?.eventName = String (describing: dicc["Subject"]!)
        //
        //        myNavController?.pushViewController(vc ?? UIViewController(), animated: true)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let vc: DetailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.eventType = "PARSHIYOT"
        vc.eventName = String (describing: dicc["Subject"]!)
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
    //     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        let lastRow = tableView.indexPathsForVisibleRows()?.last as NSIndexPath
    //        if indexPath.row == lastRow.row {
    //            if scrollToTime == true {
    //                let indexPath = NSIndexPath(forRow: groupNoToScroll, inSection: 0)
    //                tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
    //                scrollToTime = false
    //            }
    //        }
    //    }
    
    
    
    
    func readDataFromFile()
    {
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
                        arrParshita = person as NSArray
                        arrTotalParshita = person as NSArray
                        
                        tblParshiyot.reloadData()
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
                        arrParshita = person as NSArray
                        arrTotalParshita = person as NSArray
                        
                        tblParshiyot.reloadData()
                    }
                } catch {
                    // handle error
                }
            }
        }
        
        for i in 0..<arrTotalParshita.count
        {
            let dicc = arrParshita[i] as! [String : Any]
            
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
                return;
            }
        } 
    }
}





