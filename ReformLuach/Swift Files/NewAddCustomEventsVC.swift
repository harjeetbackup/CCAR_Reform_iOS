//
//  NewAddCustomEventsVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 12/29/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation

import UIKit
import EventKit
import EventKitUI
import Alamofire
import SwiftyJSON

class NewAddCustomEventsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate
{
    var event: EKEvent!
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    
    
    @IBOutlet weak var addAnother: UIButton!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet weak var dateTable: UITableView!
    @IBOutlet weak var monthTable: UITableView!
    
    @IBOutlet weak var eventTable: UITableView!
    
    @IBOutlet weak var PopupView: UIView!
    
    
     @IBOutlet weak var BGDateTable: UIView!
     @IBOutlet weak var BGMonthTable: UIView!
    
//    var arrMyEventCount: NSMutableArray()
    var arrMyEventCount = NSMutableArray()
    
    var arrMyEventDetils = NSMutableArray()
    
    var arrCustomList = NSMutableArray()
    
    var myCellViewMain: UIView!
//
    var txtTitleMain: kTextFiledPlaceHolder!
    var txtMonthMain: kTextFiledPlaceHolder!
    var txtDateMain: kTextFiledPlaceHolder!

    var buttonMonthMain: UIButton!
    var buttonDateMain: UIButton!

    var btnBeforSunsetMain: UIButton!
    var btnAfterSunsetMain: UIButton!
    
    
    var strMyTitle: String! = nil
    var strMyMonth: String! = nil
    var strMyDate: String! = nil
    var strMySunSet: String! = nil
    
    var isSunSet = false
    
    
    var arrMonthGregion = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var arrMonthHebrew = ["Nisan", "Iyyar", "Sivan", "Tamuz", "Av", "Elul", "Tishrei", "Cheshvan", "Kislev", "Tevet", "Sh'vat", "Adar"]
   
    var arrDate = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31",]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dateTable.tag = 1001
        monthTable.tag = 2001
        eventTable.tag = 5001
        
        btnAdd?.layer.cornerRadius = 5;
        btnAdd?.layer.borderColor = UIColor.white.cgColor;
        btnAdd?.layer.borderWidth = 1;
        btnAdd?.layer.masksToBounds = true;
        
        btnCancel?.layer.cornerRadius = 5;
        btnCancel?.layer.borderColor = UIColor.white.cgColor;
        btnCancel?.layer.borderWidth = 1;
        btnCancel?.layer.masksToBounds = true;
        
        addAnother.layer.cornerRadius = 5 ;
        addAnother.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addAnother.layer.borderWidth = 1;
        addAnother.layer.masksToBounds = true;
        
        BGDateTable.isHidden = true;
        BGMonthTable.isHidden = true;
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        PopupView.addGestureRecognizer(tap)
        PopupView.isUserInteractionEnabled = true
        
//        tblView.frame = CGRect(x: 40, y: 320, width: buttonView.frame.size.width-40, height: 180)
        
        myCellViewMain = UIView(frame: CGRect(x: 10, y: self.view.center.y - 125, width: self.view.frame.size.width - 20, height: 250))
        
        
        myCellViewMain.layer.borderWidth = 1;
        myCellViewMain.layer.cornerRadius = 5;
        myCellViewMain.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myCellViewMain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myCellViewMain.layer.masksToBounds = true
        
        

        txtTitleMain = kTextFiledPlaceHolder(frame: CGRect(x: 5, y: 20, width: myCellViewMain.frame.size.width - 10, height: 35))
        
        txtTitleMain.placeholder = "TITLE"
        txtTitleMain.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        txtTitleMain.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myCellViewMain .addSubview(txtTitleMain)
        txtTitleMain.delegate = self;
        
    
        
        let bottomTitleLine = UIView(frame: CGRect(x: txtTitleMain.frame.origin.x, y: txtTitleMain.frame.origin.y + txtTitleMain.frame.size.height - 1, width: txtTitleMain.frame.size.width, height: 1))
        bottomTitleLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        myCellViewMain.addSubview(bottomTitleLine)

        txtMonthMain = kTextFiledPlaceHolder(frame: CGRect(x: 5, y: 90, width: (myCellViewMain.frame.size.width - 20)/2, height: 35))
        txtMonthMain.placeholder = "MONTH"
        txtMonthMain.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        txtMonthMain.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myCellViewMain .addSubview(txtMonthMain)
        txtMonthMain.delegate = self
        
        let bottomMonthLine = UIView(frame: CGRect(x: txtMonthMain.frame.origin.x, y: txtMonthMain.frame.origin.y + txtMonthMain.frame.size.height - 1, width: txtMonthMain.frame.size.width, height: 1))
        bottomMonthLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        myCellViewMain.addSubview(bottomMonthLine)

        buttonMonthMain  = UIButton(type: UIButton.ButtonType.custom) as UIButton
        buttonMonthMain.frame = CGRect(x: txtMonthMain.frame.origin.x, y: txtMonthMain.frame.origin.y, width: txtMonthMain.frame.size.width, height: txtMonthMain.frame.size.height)
        buttonMonthMain.addTarget(self, action: #selector(buttonActionMonth), for: .touchUpInside)
        myCellViewMain.addSubview(buttonMonthMain)
        
        
//        buttonMonthMain = UIButton(frame: CGRect(x: txtMonthMain.frame.origin.x, y: txtMonthMain.frame.origin.y, width: txtMonthMain.frame.size.width, height: txtMonthMain.frame.size.height))
//        buttonMonthMain.addTarget(self, action: #selector(buttonActionMonth), for: .touchUpInside)
//         myCellViewMain.addSubview(buttonMonthMain)


        txtDateMain = kTextFiledPlaceHolder(frame: CGRect(x: (myCellViewMain.frame.size.width - 20)/2 + 15,  y: 90, width: (myCellViewMain.frame.size.width - 20)/2, height: 35))
        txtDateMain.placeholder = "DATE"
        txtDateMain.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        txtDateMain.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myCellViewMain .addSubview(txtDateMain)
        txtDateMain.delegate = self;
        
        let bottomDateLine = UIView(frame: CGRect(x: txtDateMain.frame.origin.x, y: txtDateMain.frame.origin.y + txtDateMain.frame.size.height - 1, width: txtDateMain.frame.size.width, height: 1))
        bottomDateLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        myCellViewMain.addSubview(bottomDateLine)

        
        buttonDateMain  = UIButton(type: UIButton.ButtonType.custom) as UIButton
        buttonDateMain.frame = CGRect(x: txtDateMain.frame.origin.x, y: txtDateMain.frame.origin.y, width: txtDateMain.frame.size.width, height: txtDateMain.frame.size.height)
        buttonDateMain.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
        self.myCellViewMain.addSubview(buttonDateMain)

        btnBeforSunsetMain  = UIButton(type: UIButton.ButtonType.custom) as UIButton
        btnBeforSunsetMain.frame = CGRect(x: txtMonthMain.frame.origin.x, y: txtMonthMain.frame.origin.y + 50, width: txtMonthMain.frame.size.width, height: 35)
        btnBeforSunsetMain.tag = 222
        btnBeforSunsetMain.addTarget(self, action: #selector(buttonSunSet), for: .touchUpInside)
        btnBeforSunsetMain .setTitle("Before Sunset", for: UIControl.State.normal)
        btnBeforSunsetMain .setTitle("Before Sunset", for: UIControl.State.normal)
        btnBeforSunsetMain.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
        btnBeforSunsetMain.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 5);
        btnBeforSunsetMain.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0);
        btnBeforSunsetMain .setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
        self.myCellViewMain.addSubview(btnBeforSunsetMain)

        btnAfterSunsetMain  = UIButton(type: UIButton.ButtonType.custom) as UIButton
        btnAfterSunsetMain.frame = CGRect(x: txtDateMain.frame.origin.x, y: txtDateMain.frame.origin.y + 50, width: txtDateMain.frame.size.width, height: 35)
        btnAfterSunsetMain.tag = 333
        btnAfterSunsetMain.addTarget(self, action: #selector(buttonSunSet), for: .touchUpInside)
        btnAfterSunsetMain .setTitle("After Sunset", for: UIControl.State.normal)
        btnAfterSunsetMain.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
        btnAfterSunsetMain.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 5);
        btnAfterSunsetMain.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0);
        btnAfterSunsetMain .setTitle("Before Sunset", for: UIControl.State.normal)
        btnAfterSunsetMain .setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
        self.myCellViewMain.addSubview(btnAfterSunsetMain)

        
        
//       let buttonOKMain = UIButton(frame: CGRect(x: (myCellViewMain.frame.size.width-50)/2 + 35, y: btnAfterSunsetMain.frame.origin.y + 50, width: (myCellViewMain.frame.size.width-50)/2, height: 35))
        let buttonOKMain = UIButton(frame: CGRect(x: myCellViewMain.frame.size.width/2 - myCellViewMain.frame.size.width/4, y: btnAfterSunsetMain.frame.origin.y + 50, width: myCellViewMain.frame.size.width/2, height: 40))
        buttonOKMain .setTitle("OK", for: UIControl.State.normal)
        buttonOKMain .setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
        buttonOKMain.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        buttonOKMain.layer.cornerRadius = 5;
        buttonOKMain.layer.borderWidth = 1
        buttonOKMain.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonOKMain.layer.masksToBounds = true
        buttonOKMain.addTarget(self, action: #selector(buttonActionOk), for: .touchUpInside)
        self.myCellViewMain.addSubview(buttonOKMain)
        
        
        let buttonCancelMain = UIButton(frame: CGRect(x: myCellViewMain.frame.size.width - 35, y: 5, width: 30, height: 30))
        buttonCancelMain .setImage(UIImage(named: "cross"), for: UIControl.State.normal)
        buttonCancelMain.addTarget(self, action: #selector(buttonActionCancel), for: .touchUpInside)
        self.myCellViewMain.addSubview(buttonCancelMain)
        
        
        txtTitleMain.directionMaterial = placeholderDirection.placeholderUp
        txtMonthMain.directionMaterial = placeholderDirection.placeholderUp
        txtDateMain.directionMaterial = placeholderDirection.placeholderUp

        
//        let str = "1" as String
//        arrMyEventCount .add(str)
//        eventTable .reloadData()
        myLayout()
        
        loadFirstTime()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        print("Hello World")
        self.myCellViewMain.endEditing(true);
        BGDateTable.isHidden = true
        BGMonthTable.isHidden = true
    }
    
    func loadFirstTime()
    {
        let strCheckEmpt1 = UserDefaults.standard.object(forKey: "Conv_Date") as! String
        if UserDefaults.standard.object(forKey: "Conv_Date") != nil && strCheckEmpt1 != ""
        {
            txtDateMain.text = UserDefaults.standard.string(forKey: "Conv_Date")!
            txtDateMain.textFieldDidChange()
            strMyDate = txtDateMain.text!
        }
        
        let strCheckEmpt2 = UserDefaults.standard.object(forKey: "Conv_Date") as! String
        if UserDefaults.standard.object(forKey: "Conv_Month") != nil && strCheckEmpt2 != ""
        {
            var strMonth = String()
            strMonth = UserDefaults.standard.string(forKey: "Conv_Month")!
            let month = Int(strMonth)
            
            if month == 1
            {
                txtMonthMain.text = "January"
            }
            else if month == 2
            {
                txtMonthMain.text = "February"
            }
            else if month == 3
            {
                txtMonthMain.text = "March"
            }
            else if month == 4
            {
                txtMonthMain.text = "April"
            }
            else if month == 5
            {
                txtMonthMain.text = "May"
            }
            else if month == 6
            {
                txtMonthMain.text = "June"
            }
            else if month == 7
            {
                txtMonthMain.text = "July"
            }
            else if month == 8
            {
                txtMonthMain.text = "August"
            }
            else if month == 9
            {
                txtMonthMain.text = "September"
            }
            else if month == 10
            {
                txtMonthMain.text = "October"
            }
            else if month == 11
            {
                txtMonthMain.text = "November"
            }
            else if month == 12
            {
                txtMonthMain.text = "December"
            }
            strMyMonth = txtMonthMain.text!
            txtMonthMain.textFieldDidChange()
        }
        
        
        if UserDefaults.standard.object(forKey: "Conv_SunSet") != nil
        {
            isSunSet = UserDefaults.standard.bool(forKey: "Conv_SunSet")
            
            if(isSunSet == true )
            {
                strMySunSet = "AFTER SUNSET"
                btnBeforSunsetMain.setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
                btnAfterSunsetMain.setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
            }
            else
            {
                strMySunSet = "BEFORE SUNSET"
                btnBeforSunsetMain.setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
                btnAfterSunsetMain.setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
                
            }
            
        }
        
        myCellViewMain.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        PopupView .addSubview(myCellViewMain)
//        PopupView .bringSubview(toFront: myCellViewMain)
        PopupView.isHidden = false;
    }
    
    
    func myLayout()
    {
        
        ////// first view ..............
        BGMonthTable.frame = CGRect(x: myCellViewMain.frame.origin.x + txtMonthMain.frame.origin.x, y: myCellViewMain.frame.origin.y + txtMonthMain.frame.origin.y + txtMonthMain.frame.size.height, width: txtMonthMain.frame.size.width, height: CGFloat(44 * 5))
        
        BGDateTable.frame = CGRect(x: myCellViewMain.frame.origin.x + txtDateMain.frame.origin.x, y: myCellViewMain.frame.origin.y + txtDateMain.frame.origin.y + txtDateMain.frame.size.height, width: txtDateMain.frame.size.width, height: CGFloat(44 * 5))
        
        monthTable.frame = CGRect(x: 0, y: 0, width: BGMonthTable.frame.size.width, height: BGMonthTable.frame.size.height)
        dateTable.frame = CGRect(x: 0, y: 0, width: BGDateTable.frame.size.width, height: BGDateTable.frame.size.height)
        
        let layer1 = BGMonthTable.layer
        layer1.shadowColor = UIColor.black.cgColor
        layer1.shadowOffset = CGSize(width: 0, height: 10)
        layer1.shadowOpacity = 0.8
        layer1.shadowRadius = 7
        
        let layer3 = BGDateTable.layer
        layer3.shadowColor = UIColor.black.cgColor
        layer3.shadowOffset = CGSize(width: 0, height: 10)
        layer3.shadowOpacity = 0.8
        layer3.shadowRadius = 7
        
        
       
    }
    
    
    @objc func buttonActionOk()
    {
        strMyTitle = txtTitleMain.text!
        let dic = NSMutableDictionary()
        if strMyTitle != nil && strMyMonth != nil && strMyDate != nil 
        {
            if strMyTitle != "" && strMyMonth != "" && strMyDate != ""
            {
                dic .setObject(strMyTitle, forKey: "evTitle" as NSCopying);
                dic .setObject(strMyMonth, forKey: "evMonth" as NSCopying);
                dic .setObject(strMyDate, forKey: "evDate" as NSCopying);
                dic .setObject(strMySunSet, forKey: "evSunSet" as NSCopying);
                arrMyEventDetils .add(dic)
            
//            let str = "1" as String
//            arrMyEventCount .add(str)
                eventTable .reloadData()
                PopupView.isHidden = true;
            
                strMyDate = nil
                strMyMonth = nil
                strMyTitle = nil
                strMySunSet = nil
                txtTitleMain.text = ""
                txtMonthMain.text = ""
                txtDateMain.text = ""
                txtTitleMain.textFieldDidChange()
                txtMonthMain.textFieldDidChange()
                txtDateMain.textFieldDidChange()
            }
        }
       
    }
    
    @objc func buttonActionCancel()
    {
        PopupView.isHidden = true;
        self .dismiss(animated: true, completion: nil)
    }
    

   
//    func buttonActionMonth(sender: UIButton)
    @objc func buttonActionMonth() {
        txtTitleMain.resignFirstResponder()
        self.view.endEditing(true)
//        if buttonDate11.tag == 2001
//        {
//        BGMonthTable.frame = CGRect(x: myCellViewMain.frame.origin.x + txtMonthMain.frame.origin.x, y: myCellViewMain.frame.origin.y + txtMonthMain.frame.origin.y + txtMonthMain.frame.size.height, width: txtMonthMain.frame.size.width, height: CGFloat(44 * 7))
            self.view .endEditing(true)
//        monthTable.frame = BGMonthTable.frame;
        
        
        myCellViewMain.bringSubviewToFront(BGMonthTable)
        
//        myCellViewMain .addSubview(BGMonthTable)

            BGDateTable.isHidden = true
            BGMonthTable.isHidden = false
            
//            arrow_month1.image = UIImage(named: "Down_arrow")
//            arrow_Year1.image = UIImage(named: "Down_arrow")
//

//            buttonMonth11.tag = 5011
//            buttonYear11.tag = 5012
            
//        }
//        else
//        {
//            hidden()
//        }
    }

//    func buttonActionDate(sender: UIButton)
    @objc func buttonActionDate() {
        txtTitleMain.resignFirstResponder()
        self.view.endEditing(true)
//        if buttonDate11.tag == 1001
//        {
//        BGDateTable.frame = CGRect(x: myCellViewMain.frame.origin.x + txtDateMain.frame.origin.x, y: myCellViewMain.frame.origin.y + txtDateMain.frame.origin.y + txtDateMain.frame.size.height, width: txtDateMain.frame.size.width, height: CGFloat(44 * 7))
            self.view .endEditing(true)
        myCellViewMain.bringSubviewToFront(BGDateTable)
//        myCellViewMain .addSubview(BGDateTable)
            BGDateTable.isHidden = false
            BGMonthTable.isHidden = true
        
            dateTable.reloadData()

//            arrow_month1.image = UIImage(named: "Down_arrow")
//            arrow_Year1.image = UIImage(named: "Down_arrow")


//            .tag = 5011
//            buttonYear11.tag = 5012
//            buttonDate11.tag = 6013

//        }
//        else
//        {
//            hidden()
//        }
    }
    
    @objc func buttonSunSet(_ sender: UIButton) {
        if sender.tag == 222 {
            strMySunSet = "BEFORE SUNSET"
            btnBeforSunsetMain .setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
            btnAfterSunsetMain .setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
        } else {
            strMySunSet = "AFTER SUNSET"
            btnBeforSunsetMain .setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
            btnAfterSunsetMain .setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
        }
    }
    
    @objc func buttonDelete(_ sender: UIButton) {
        self.eventTable.beginUpdates()
        let indexPath = IndexPath(row: sender.tag, section: 0)
//        NSIndexPath(); *path = [NSIndexPath, indexPathForRow: sender.tag inSection:0];
        arrMyEventDetils .removeObject(at: indexPath.row)
        self.eventTable.deleteRows(at: [indexPath], with: .automatic)
        self.eventTable.endUpdates()
        eventTable.reloadData()
        if arrMyEventDetils.count <= 0 {
            btnAddAnother(sender)
        }
    }

    @IBAction func btnAddAnother(_ sender: UIButton) {
        UserDefaults.standard.set("", forKey: "Conv_Date")
        UserDefaults.standard.set("", forKey: "Conv_Month")
        UserDefaults.standard.set("", forKey: "Conv_Year")
        UserDefaults.standard.set("", forKey: "Conv_SunSet")
        
        txtTitleMain.text = nil;
        txtMonthMain.text = nil;
        txtDateMain.text = nil;
        
        strMySunSet = "BEFORE SUNSET"
        btnBeforSunsetMain .setImage(UIImage(named: "Sunset_selected"), for: UIControl.State.normal)
        btnAfterSunsetMain .setImage(UIImage(named: "Sunset_Unselected"), for: UIControl.State.normal)
        
        PopupView .addSubview(myCellViewMain)
        PopupView.isHidden = false;
        
        txtTitleMain.text = ""
        txtMonthMain.text = ""
        txtDateMain.text = ""
        txtTitleMain.textFieldDidChange()
        txtMonthMain.textFieldDidChange()
        txtDateMain.textFieldDidChange()

     
    }
    
    @IBAction func btnCancel(_ sender: UIButton)
    {
        self .dismiss(animated: true, completion: nil)
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        BGDateTable.isHidden = true;
        BGMonthTable.isHidden = true;
    }
    
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtDateMain.resignFirstResponder()
        myCellViewMain.endEditing(true)
        PopupView.endEditing(true)
        self.view.endEditing(true)
        return false
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
//        strMyTitle = string;
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1001 {
            return arrDate.count;
        } else if tableView.tag == 2001 {
            return arrMonthGregion.count
        } else {
//            return arrMyEventCount.count
            return arrMyEventDetils.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 5001 {
            let identifier = "eventCountCell"
            let cell: eventCountCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? eventCountCell
//            if (arrMyEventDetils.count > 0 && arrMyEventDetils.count == arrMyEventCount.count - 1)
            if (arrMyEventDetils.count > 0) {
//                let txtTitle: kTextFiledPlaceHolder!
//                let txtMonth: kTextFiledPlaceHolder!
//                let txtDate: kTextFiledPlaceHolder!
                let myCellView = UIView(frame: CGRect(x: 10, y: 5, width: self.view.frame.size.width - 20, height: 50))
                myCellView.layer.borderWidth = 1;
                myCellView.layer.cornerRadius = 5;
                myCellView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                myCellView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                myCellView.layer.masksToBounds = true
                let txtTitle = kTextFiledPlaceHolder(frame: CGRect(x: 10, y: 20, width: myCellView.frame.size.width - 20, height: 35))
//                txtTitle.frame = CGRect(x: 10, y: 20, width: myCellView.frame.size.width - 20, height: 35)
                txtTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                txtTitle.tag = indexPath.row;
                txtTitle.delegate = self;
                txtTitle.directionMaterial = placeholderDirection.placeholderUp
                txtTitle.contentVerticalAlignment = .top
                myCellView .addSubview(txtTitle)
                let bottomTitleLine = UIView(frame: CGRect(x: txtTitle.frame.origin.x, y: txtTitle.frame.origin.y + txtTitle.frame.size.height - 1, width: txtTitle.frame.size.width, height: 1))
                bottomTitleLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
                
                
                myCellView.addSubview(bottomTitleLine)
            
        /*   let txtMonth = kTextFiledPlaceHolder(frame: CGRect(x: 10, y: 90, width: (myCellView.frame.size.width - 30)/2, height: 35))
//                txtMonth.frame = CGRect(x: 10, y: 90, width: (myCellView.frame.size.width - 30)/2, height: 35)
                txtMonth.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                txtMonth.tag = indexPath.row;
                txtMonth.delegate = self;
                txtMonth.directionMaterial = placeholderDirection.placeholderUp

                myCellView.addSubview(txtMonth);
            
                let bottomMonthLine = UIView(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y + txtMonth.frame.size.height - 1, width: txtMonth.frame.size.width, height: 1))
                bottomMonthLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
                
                myCellView.addSubview(bottomMonthLine)
            
//                let buttonMonth = UIButton(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y, width: txtMonth.frame.size.width, height: txtMonth.frame.size.height))
////                buttonMonth.addTarget(self, action: #selector(buttonActionMonth(:buttomMonth.sender)), for: .touchUpInside)
//                buttonMonth.addTarget(self, action: #selector(buttonActionMonth(sender: buttonMonth)), for: .touchUpInside)
//                buttonMonth.tag = indexPath.row;
//                myCellView.addSubview(buttonMonth)
            
            
                let txtDate = kTextFiledPlaceHolder(frame: CGRect(x: (myCellView.frame.size.width - 30)/2 + 20, y: 90, width: (myCellView.frame.size.width - 30)/2, height: 35))
//                txtDate.frame = CGRect(x: (myCellView.frame.size.width - 30)/2 + 20, y: 90, width: (myCellView.frame.size.width - 30)/2, height: 35)
                txtDate.delegate = self;
                txtDate.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                txtDate.tag = indexPath.row;
                txtDate.directionMaterial = placeholderDirection.placeholderUp
                myCellView.addSubview(txtDate)
                let bottomDateLine = UIView(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y + txtDate.frame.size.height - 1, width: txtDate.frame.size.width, height: 1))
                bottomDateLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
                
                myCellView.addSubview(bottomDateLine)
            
//                let buttonDate = UIButton(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y, width: txtDate.frame.size.width, height: txtDate.frame.size.height))
//                buttonDate.addTarget(self, action: #selector(buttonActionDate(sender: buttonDate)), for: .touchUpInside)
//                buttonDate.tag = indexPath.row;
//                myCellView.addSubview(buttonDate)
            
                let btnBeforSunset = UIButton(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y + 50, width: txtMonth.frame.size.width, height: 35))
                btnBeforSunset.tag = indexPath.row
                btnBeforSunset.addTarget(self, action: #selector(buttonSunSet), for: .touchUpInside)
                btnBeforSunset .setTitle("Before Sunset", for: UIControlState.normal)
                btnBeforSunset .setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                btnBeforSunset.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
                btnBeforSunset.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 5);
                btnBeforSunset.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 0);
                btnBeforSunset.tag = indexPath.row;
                myCellView.addSubview(btnBeforSunset)
            
                let btnAfterSunset = UIButton(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y + 50, width: txtDate.frame.size.width, height: 35))
                btnAfterSunset.tag = indexPath.row
                btnAfterSunset.addTarget(self, action: #selector(buttonSunSet), for: .touchUpInside)
                btnAfterSunset .setTitle("After Sunset", for: UIControlState.normal)
                btnAfterSunset .setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                btnAfterSunset.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
            //                btnAfterSunset.contentEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
                btnAfterSunset.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 5);
                btnAfterSunset.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 0);
                myCellView.addSubview(btnAfterSunset)*/
                
                
                let btnDelete = UIButton(frame: CGRect(x: myCellView.frame.size.width - 45, y: 5, width: 35, height: 35))
                btnDelete.tag = indexPath.row
                btnDelete.addTarget(self, action: #selector(buttonDelete), for: .touchUpInside)
                btnDelete .setImage(UIImage(named: "cross"), for: UIControl.State.normal)
                btnDelete.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
                myCellView.addSubview(btnDelete)
            
                
                txtTitle.isUserInteractionEnabled = false;
//                txtMonth.isUserInteractionEnabled = false;
//                txtDate.isUserInteractionEnabled = false;
//                btnAfterSunset.isUserInteractionEnabled = false;
//                btnBeforSunset.isUserInteractionEnabled = false;
                
                
                let dicc = arrMyEventDetils[indexPath.row] as! [String : Any]
                
                txtTitle.text = String (describing: dicc["evTitle"]!)
                txtTitle.textFieldDidChange()
                
                
                
        /*      txtMonth.text = String (describing: dicc["evMonth"]!)
                txtMonth.textFieldDidChange()
                
                txtDate.text = String (describing: dicc["evDate"]!)
                txtDate.textFieldDidChange()
                
                let strSunSet = String (describing: dicc["evSunSet"]!) as String!
                
//                strMySunSet = "BEFORE SUNSET"
//                strMySunSet = "AFTER SUNSET"
                
                if strSunSet == "BEFORE SUNSET"
                {
                    btnBeforSunset .setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                    btnAfterSunset .setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                }
                else
                {
                    btnBeforSunset .setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                    btnAfterSunset .setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                }
           */

                
//                txtTitle.directionMaterial = placeholderDirection.placeholderUp
//                txtMonth.directionMaterial = placeholderDirection.placeholderUp
//                txtDate.directionMaterial = placeholderDirection.placeholderUp
                
                txtTitle.directionMaterial = placeholderDirection.placeholderUp
             //   ===================================
            /*    txtMonth.directionMaterial = placeholderDirection.placeholderUp
                txtDate.directionMaterial = placeholderDirection.placeholderUp*/
                
            // ===========================================
            
                cell .addSubview(myCellView);
//        }
//        else
//        {
//                 let myCellView = UIView(frame: CGRect(x: 10, y: 5, width: self.view.frame.size.width - 20, height: 180))
//                myCellView.layer.borderWidth = 1;
//                myCellView.layer.cornerRadius = 5;
//                myCellView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                myCellView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                myCellView.layer.masksToBounds = true
//
//
//                let txtTitle = kTextFiledPlaceHolder(frame: CGRect(x: 5, y: 20, width: myCellView.frame.size.width - 10, height: 35))
//                txtTitle.placeholder = "TITLE"
//                txtTitle.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//                txtTitle.tag = indexPath.row;
//                txtTitle.delegate = self;
//                 myCellView .addSubview(txtTitle)
//                 let bottomTitleLine = UIView(frame: CGRect(x: txtTitle.frame.origin.x, y: txtTitle.frame.origin.y + txtTitle.frame.size.height - 1, width: txtTitle.frame.size.width, height: 1))
//                 bottomTitleLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
//                 myCellView.addSubview(bottomTitleLine)
//
//                 let txtMonth = kTextFiledPlaceHolder(frame: CGRect(x: 5, y: 90, width: (myCellView.frame.size.width - 20)/2, height: 35))
//                txtMonth.placeholder = "MONTH"
//                txtMonth.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//                 txtMonth.tag = indexPath.row;
//                txtMonth.delegate = self;
//                 myCellView.addSubview(txtMonth);
//
//                 let bottomMonthLine = UIView(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y + txtMonth.frame.size.height - 1, width: txtMonth.frame.size.width, height: 1))
//                 bottomMonthLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
//                 myCellView.addSubview(bottomMonthLine)
//
//                let buttonMonth = UIButton(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y, width: txtMonth.frame.size.width, height: txtMonth.frame.size.height))
//                 buttonMonth.addTarget(self, action: #selector(buttonActionMonth), for: .touchUpInside)
//                buttonMonth.addTarget(self, action: #selector(buttonActionMonth(sender: buttonMonth)), for: .touchUpInside)
//
//                 buttonMonth.tag = indexPath.row;
//                 myCellView.addSubview(buttonMonth)
//
//
//                let txtDate = kTextFiledPlaceHolder(frame: CGRect(x: (myCellView.frame.size.width - 20)/2 + 15, y: 90, width: (myCellView.frame.size.width - 20)/2, height: 35))
//                txtDate.placeholder = "DATE"
//                txtDate.placeHolderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//                 txtDate.tag = indexPath.row;
//                txtDate.delegate = self;
//                myCellView.addSubview(txtDate)
//                let bottomDateLine = UIView(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y + txtDate.frame.size.height - 1, width: txtDate.frame.size.width, height: 1))
//                    bottomDateLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
//                myCellView.addSubview(bottomDateLine)
//
//                let buttonDate = UIButton(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y, width: txtDate.frame.size.width, height: txtDate.frame.size.height))
////                   buttonDate.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
//                buttonDate.addTarget(self, action: #selector(buttonActionDate(sender: buttonDate)), for: .touchUpInside)
//
//                buttonDate.tag = indexPath.row;
//                myCellView.addSubview(buttonDate)
//
//
//
//
//                let btnBeforSunset = UIButton(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y + 50, width: txtMonth.frame.size.width, height: 35))
//                btnBeforSunset.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
//                btnBeforSunset .setTitle("Before Sunset", for: UIControlState.normal)
//                btnBeforSunset .setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
//                btnBeforSunset.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
//                btnBeforSunset.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 5);
//                btnBeforSunset.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 0);
//                btnBeforSunset.tag = indexPath.row;
//                myCellView.addSubview(btnBeforSunset)
//
//                let btnAfterSunset = UIButton(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y + 50, width: txtDate.frame.size.width, height: 35))
//                btnAfterSunset.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
//                btnAfterSunset .setTitle("After Sunset", for: UIControlState.normal)
//                btnAfterSunset .setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
//                btnAfterSunset.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
////                btnAfterSunset.contentEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
//                btnAfterSunset.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 5);
//                btnAfterSunset.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 0);
//                btnAfterSunset.tag = indexPath.row
//                myCellView.addSubview(btnAfterSunset)
//
//                txtTitle.directionMaterial = placeholderDirection.placeholderUp
//                txtMonth.directionMaterial = placeholderDirection.placeholderUp
//                txtDate.directionMaterial = placeholderDirection.placeholderUp
                
                
//
//                cell .addSubview(myCellView);
            }
            return cell;
        }
        else
        {

            let identifier = "daCustomCell"
            let cell: daCustomCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? daCustomCell
            
                if tableView.tag == 1001
                {
                    cell.lblTitle.text = arrDate[indexPath.row];
                }
                if tableView.tag == 2001
                {
                    cell.lblTitle.text = arrMonthGregion[indexPath.row];
                }
        
        return cell
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView.tag == 5001
        {
            return 60;
        }
        else
        {
            return 50;//Choose your custom row height
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        txtTitleMain.resignFirstResponder()
        self.view.endEditing(true);
        
        
        
        if tableView.tag == 2001
        {
            txtMonthMain.text = arrMonthGregion[indexPath.row];
            BGDateTable.isHidden = true;
            BGMonthTable.isHidden = true;
            txtMonthMain.textFieldDidChange()
            strMyMonth = txtMonthMain.text
//            strMyMonth = String (describing: indexPath.row + 1)
        }
        else if tableView.tag == 1001
        {
            txtDateMain.text = arrDate[indexPath.row];
            BGDateTable.isHidden = true;
            BGMonthTable.isHidden = true;
            txtDateMain.textFieldDidChange()
            strMyDate = String (describing: indexPath.row)
//            if isAfterSunSet1 == true
//            {
//                var dd = Int(txtDate1.text!)
//                dd = dd! + 1
//                strD1 = String(describing: dd)
//            }
//            else
//            {
//                strD1 = txtDate1.text
//            }
        }
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
        dataSyna()
    }
    
    func dataSyna()
    {
        if arrMyEventDetils.count <= 0
        {
            UserDefaults.standard.set("", forKey: "Conv_Date")
            UserDefaults.standard.set("", forKey: "Conv_Month")
            UserDefaults.standard.set("", forKey: "Conv_Year")
            UserDefaults.standard.set("", forKey: "Conv_SunSet")
            return;
        }
        
        var arrList = NSArray()
        arrCustomList.removeAllObjects();

        if UserDefaults.standard.object(forKey: "CustomLst") != nil
        {
            let userdefaults = UserDefaults.standard
            arrList = userdefaults.array(forKey: "CustomLst")! as NSArray

            if (arrList.count > 0)
            {
                var mutableDictionary = [String: AnyObject]()

                for i in 0..<arrList.count
                {
                    mutableDictionary = arrList[i] as! [String : AnyObject]
                    arrCustomList .add(mutableDictionary)
                }
            }
        }
        
        let date123 = Date()
        let calendar123 = Calendar.current
        
        let year123 = calendar123.component(.year, from: date123)
        
        
        
        for i in 0..<arrMyEventDetils.count
        {
            let dateComponents = NSDateComponents()
            
            let dicc = arrMyEventDetils[i] as! [String : Any]
            let myLocalDic = NSMutableDictionary()
            
            let strdddd = (String (describing: dicc["evDate"]!)) 
            
            //            let sdd = strdddd as! NSInteger
            //            print(sdd)
            
            
            if (strdddd == "1")
            {
                dateComponents.day = 1
            }
            else if (strdddd == "2")
            {
                dateComponents.day = 2
            }
            else if (strdddd == "3")
            {
                dateComponents.day = 3
            }
            else if (strdddd == "4")
            {
                dateComponents.day = 4
            }
            else if (strdddd == "5")
            {
                dateComponents.day = 5
            }
            else if (strdddd == "6")
            {
                dateComponents.day = 6
            }
            else if (strdddd == "7")
            {
                dateComponents.day = 7
            }
            else if (strdddd == "8")
            {
                dateComponents.day = 8
            }
            else if (strdddd == "9")
            {
                dateComponents.day = 9
            }
            else if (strdddd == "10")
            {
                dateComponents.day = 10
            }
            else if (strdddd == "11")
            {
                dateComponents.day = 11
            }
            else if (strdddd == "12")
            {
                dateComponents.day = 12
            }
            else if (strdddd == "13")
            {
                dateComponents.day = 13
            }
            else if (strdddd == "14")
            {
                dateComponents.day = 14
            }
            else if (strdddd == "15")
            {
                dateComponents.day = 15
            }
            else if (strdddd == "16")
            {
                dateComponents.day = 16
            }
            else if (strdddd == "17")
            {
                dateComponents.day = 17
            }
            else if (strdddd == "18")
            {
                dateComponents.day = 18
            }
            else if (strdddd == "19")
            {
                dateComponents.day = 19
            }
            else if (strdddd == "20")
            {
                dateComponents.day = 20
            }
            else if (strdddd == "21")
            {
                dateComponents.day = 21
            }
            else if (strdddd == "22")
            {
                dateComponents.day = 22
            }
            else if (strdddd == "23")
            {
                dateComponents.day = 23
            }
            else if (strdddd == "24")
            {
                dateComponents.day = 24
            }
            else if (strdddd == "25")
            {
                dateComponents.day = 25
            }
            else if (strdddd == "26")
            {
                dateComponents.day = 26
            }
            else if (strdddd == "27")
            {
                dateComponents.day = 27
            }
            else if (strdddd == "28")
            {
                dateComponents.day = 28
            }
            else if (strdddd == "29")
            {
                dateComponents.day = 29
            }
            else if (strdddd == "30")
            {
                dateComponents.day = 30
            }
            else if (strdddd == "31")
            {
                dateComponents.day = 31
            }
            
            let strMMM = (String (describing: dicc["evDate"]!))
            if strMMM != "" {
                if (strdddd == "January") {
                    dateComponents.month = 1
                } else if (strdddd == "February") {
                    dateComponents.month = 2
                } else if (strdddd == "March") {
                    dateComponents.month = 3
                } else if (strdddd == "April") {
                    dateComponents.month = 4
                } else if (strdddd == "May") {
                    dateComponents.month = 5
                }
                else if (strdddd == "June")
                {
                    dateComponents.month = 6
                }
                else if (strdddd == "July")
                {
                    dateComponents.month = 7
                }
                else if (strdddd == "August")
                {
                    dateComponents.month = 8
                }
                else if (strdddd == "September")
                {
                    dateComponents.month = 9
                }
                else if (strdddd == "October")
                {
                    dateComponents.month = 10
                }
                else if (strdddd == "November")
                {
                    dateComponents.month = 11
                }
                else if (strdddd == "December")
                {
                    dateComponents.month = 12
                }
            }
            //            dateComponents.day = Int(String (describing: dicc["evDate"]!))!
            
//            dateComponents.month = Int(String (describing: dicc["evMonth"]!))!
//            dateComponents.year = Int(String (describing: dicc["evYear"]!))!
            
//            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
//                let date = gregorianCalendar.date(from: dateComponents as DateComponents)
//            {
//                let weekday = gregorianCalendar.component(.year, from: date)
//                print(weekday)
//
//                let event:EKEvent = EKEvent(eventStore: eventStore)
//                event.title = String (describing: dicc["evTitle"]!)
//                event.startDate = date
//                event.endDate = date.addingTimeInterval(60*60*1)
//                event.notes = ""
//                event.calendar = eventStore.defaultCalendarForNewEvents
//                do
//                {
//                    try eventStore.save(event, span: .thisEvent)
//                    print("events added with dates:")
//                }
//                catch let e as NSError
//                {
//                    print(e.description)
//                    return
//                }
//
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "MM/dd/yyyy"
//                let dateStart = dateFormatter.string(from:date as Date)
//                let dateEnd = dateFormatter.string(from:date.addingTimeInterval(60*60*1) as Date)
//
//                //                myLocalDic .setObject(event.notes, forKey: "eventType" as NSCopying);
//                myLocalDic .setObject(event.title, forKey: "eventTitle" as NSCopying);
//                myLocalDic .setObject(dateStart, forKey: "eventSDate" as NSCopying);
//                myLocalDic .setObject(dateEnd, forKey: "eventEDate" as NSCopying);
//
//                //                self.dismiss(animated: true, completion: nil)
//            }
//            arrMyEventDetils .add(myLocalDic)
            for i in 0 ... 100 {
//                let dateComponents = NSDateComponents()
                
//                dateComponents.day = Int(strD)!
//                dateComponents.month = Int(strM)!
                dateComponents.year = Int(year123) + i
                
                if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
                    let date = gregorianCalendar.date(from: dateComponents as DateComponents) {
                    let weekday = gregorianCalendar.component(.year, from: date)
                    print(weekday)
                    
                    let event:EKEvent = EKEvent(eventStore: eventStore)
                    event.title = String (describing: dicc["evTitle"]!)
                    event.startDate = date
                    event.endDate = date.addingTimeInterval(60*60*24)
                    event.notes = ""
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    do
                    {
                        try eventStore.save(event, span: .thisEvent)
                        print("events added with dates:")
                    }
                    catch let e as NSError
                    {
                        print(e.description)
                        return
                    }
                }
            }
            dateComponents.year = Int(year123)
            if let gregorianCalendar12345 = NSCalendar(calendarIdentifier: .gregorian),
                let date12345 = gregorianCalendar12345.date(from: dateComponents as DateComponents) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let dateStart = dateFormatter.string(from:date12345 as Date)
                let dateEnd = dateFormatter.string(from:date12345.addingTimeInterval(60*60*1) as Date)
                //                myLocalDic .setObject(event.notes, forKey: "eventType" as NSCopying);
                myLocalDic .setObject((String (describing: dicc["evTitle"]!)), forKey: "eventTitle" as NSCopying);
                myLocalDic .setObject(dateStart, forKey: "eventSDate" as NSCopying);
                myLocalDic .setObject(dateEnd, forKey: "eventEDate" as NSCopying);
            }
            arrCustomList .add(myLocalDic)
        }
        self.dismiss(animated: true, completion: nil)
        self.view.makeToast("events added Successfully")
        UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
    }
}

class daCustomCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}

class eventCountCell: UITableViewCell {
    @IBOutlet weak var myView: UIView!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
