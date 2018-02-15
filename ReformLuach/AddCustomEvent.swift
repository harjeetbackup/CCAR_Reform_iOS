//
//  AddCustomEvent.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/14/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//


import Foundation
import UIKit
import EventKit
import EventKitUI
import Alamofire
import SwiftyJSON
 

class AddCustomEvent: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIAlertViewDelegate//UIPickerViewDelegate
{
    @IBOutlet weak var CustomHeaderImage: UIImageView!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var srrlView: UIScrollView?
    
    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var txtTep: kTextFiledPlaceHolder!
  
    var event: EKEvent!
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    var eventDetailsArray = [AnyHashable]()
    
    var strPickerDate = NSString()
    
    // First View.....
    @IBOutlet weak var FirstView: UIView!
   
    @IBOutlet weak var txtTitle1: kTextFiledPlaceHolder!
    @IBOutlet var txtMonth1: kTextFiledPlaceHolder!
    @IBOutlet var txtYear1: kTextFiledPlaceHolder!
    @IBOutlet var txtDate1: kTextFiledPlaceHolder!
    @IBOutlet weak var tblMonth1: UITableView!
    @IBOutlet weak var tblYear1: UITableView!
    @IBOutlet weak var tblDate1: UITableView!
    @IBOutlet weak var MonthBGView1: UIView!
    @IBOutlet weak var YearBGView1: UIView!
    @IBOutlet weak var DateBGView1: UIView!
    @IBOutlet weak var btnBeforeSunset1: UIButton!
    @IBOutlet weak var btnAfterSunset1: UIButton!
    var buttonMonth11: UIButton!
    var buttonYear11: UIButton!
    var buttonDate11: UIButton!
    @IBOutlet weak var arrow_month1: UIImageView!
    @IBOutlet weak var arrow_Year1: UIImageView!
    @IBOutlet weak var arrow_Day1: UIImageView!
    
    // Second View.....
    @IBOutlet weak var SecondView: UIView!
    @IBOutlet weak var txtTitle2: kTextFiledPlaceHolder!
    @IBOutlet var txtMonth2: kTextFiledPlaceHolder!
    @IBOutlet var txtYear2: kTextFiledPlaceHolder!
    @IBOutlet var txtDate2: kTextFiledPlaceHolder!
    @IBOutlet weak var tblMonth2: UITableView!
    @IBOutlet weak var tblYear2: UITableView!
    @IBOutlet weak var tblDate2: UITableView!
    @IBOutlet weak var MonthBGView2: UIView!
    @IBOutlet weak var YearBGView2: UIView!
    @IBOutlet weak var DateBGView2: UIView!
    @IBOutlet weak var btnBeforeSunset2: UIButton!
    @IBOutlet weak var btnAfterSunset2: UIButton!
    var buttonMonth22: UIButton!
    var buttonYear22: UIButton!
    var buttonDate22: UIButton!
    @IBOutlet weak var arrow_month2: UIImageView!
    @IBOutlet weak var arrow_Year2: UIImageView!
    @IBOutlet weak var arrow_Day2: UIImageView!
    
    // Third View.....
    @IBOutlet weak var ThirdView: UIView!
    @IBOutlet weak var txtTitle3: kTextFiledPlaceHolder!
    @IBOutlet var txtMonth3: kTextFiledPlaceHolder!
    @IBOutlet var txtYear3: kTextFiledPlaceHolder!
    @IBOutlet var txtDate3: kTextFiledPlaceHolder!
    @IBOutlet weak var tblMonth3: UITableView!
    @IBOutlet weak var tblYear3: UITableView!
    @IBOutlet weak var tblDate3: UITableView!
    @IBOutlet weak var MonthBGView3: UIView!
    @IBOutlet weak var YearBGView3: UIView!
    @IBOutlet weak var DateBGView3: UIView!
    @IBOutlet weak var btnBeforeSunset3: UIButton!
    @IBOutlet weak var btnAfterSunset3: UIButton!
    var buttonMonth33: UIButton!
    var buttonYear33: UIButton!
    var buttonDate33: UIButton!
    @IBOutlet weak var arrow_month3: UIImageView!
    @IBOutlet weak var arrow_Year3: UIImageView!
    @IBOutlet weak var arrow_Day3: UIImageView!
    
    
    
    
    @IBOutlet weak var scrl_WidthConst: NSLayoutConstraint!
    
//    @IBOutlet weak var txtEventType1_widthConst: NSLayoutConstraint!
    
    @IBOutlet weak var txtmonth1_withConst: NSLayoutConstraint!
    
//    @IBOutlet weak var txtEventType1_widthConst2: NSLayoutConstraint!
    
    @IBOutlet weak var txtmonth2_widthConst: NSLayoutConstraint!
    
    
//    @IBOutlet weak var txtEventType1_widthConst3: NSLayoutConstraint!
    
    @IBOutlet weak var txtmonth3_widthCont: NSLayoutConstraint!
    
    
    
//    @IBOutlet weak var btnSwitch: UISwitch!
//
//    @IBOutlet weak var BtnConvertDate: UIButton!
//    @IBOutlet weak var btnConvertDate_HConst: NSLayoutConstraint!
//
//    @IBOutlet weak var btnConvert_TOPCons: NSLayoutConstraint!
     var arrCustomList = NSMutableArray()
    
    var arrMyEvents = NSMutableArray()
   
    var arrMonth: NSArray!
    var arrYear: NSArray!
    
    var isSunSet = false
    
    var isAfterSunSet1  = false
    var isAfterSunSet2 = false
    var isAfterSunSet3 = false
    
    
    
    
    
    var strL = String()
    
    var arrMonthGregion = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    var arrMonthHebrew = ["Nisan", "Iyyar", "Sivan", "Tamuz", "Av", "Elul", "Tishrei", "Cheshvan", "Kislev", "Tevet", "Sh'vat", "Adar"]
    
    var arrYearGregion = ["1920","1921","1922","1923","1924","1925","1926","1927","1928","1929","1930","1931","1932","1933","1934","1935","1936","1937","1938","1939","1940","1941","1942","1943","1944","1945","1946","1947","1948","1949","1950","1951","1952","1953","1954","1955","1956","1957","1958","1959","1960","1961","1962","1963","1964","1965","1966","1967","1968","1969","1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050"]
    
    var arrYearHebrew = ["5685","5686","5687","5688","5689","5690","5691","5692","5693","5694","5695","5696","5697","5698","5699","5700","5701","5702","5703","5704","5705","5706","5707","5708","5709","5710","5711","5712","5713","5714","5715","5716","5717","5718","5719","5720","5721","5722","5723","5724","5725","5726","5727","5728","5729","5730","5731","5732","5733","5734","5735","5736","5737","5738","5739","5740","5741","5742","5743","5744","5745","5746","5747","5748","5749","5750","5751","5752","5753","5754","5755","5756","5757","5758","5759","5760","5761","5762","5763","5764","5765","5766","5767","5768","5769","5770","5771","5772","5773","5774","5775","5776","5777","5778","5779","5780","5781","5782","5783","5784","5785","5786","5787","5788","5789","5790","5791","5792","5793","5794","5795","5796","5797","5798","5799","5800","5801","5802","5803","5804","5805","5806","5807","5808","5809","5810","5811"]
    
    
    var arrDate = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31",]
    var arrLanguage = ["Hebrew"]
    
    let tap1 = UITapGestureRecognizer()
    //    var isCheckSunSet = false
    
    var strM1: String!
    var strD1: String!
    var strY1: String!
    
    var strM2: String!
    var strD2: String!
    var strY2: String!
    
    var strM3: String!
    var strD3: String!
    var strY3: String!
    
    var strTxtEvent1: String!
    var strTxtTitle1: String!
    
    var strTxtEvent2: String!
    var strTxtTitle2: String!
    
    var strTxtEvent3: String!
    var strTxtTitle3: String!
    
    var MyTotalView: String!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.eventDatePicker.isHidden = true
//        self.pickerToolbar.isHidden = true
        
        btnAdd?.layer.cornerRadius = 5;
        btnAdd?.layer.borderColor = UIColor.white.cgColor;
        btnAdd?.layer.borderWidth = 1;
        btnAdd?.layer.masksToBounds = true;
        
        btnCancel?.layer.cornerRadius = 5;
        btnCancel?.layer.borderColor = UIColor.white.cgColor;
        btnCancel?.layer.borderWidth = 1;
        btnCancel?.layer.masksToBounds = true;
        
        txtTitle1.delegate = self
        txtTitle2.delegate = self
        txtTitle3.delegate = self

        tblMonth1.tag = 1001;
        tblYear1.tag = 1002;
        tblDate1.tag = 1003;
        
        tblMonth2.tag = 2001;
        tblYear2.tag = 2002;
        tblDate2.tag = 2003;
        
        tblMonth3.tag = 3001;
        tblYear3.tag = 3002;
        tblDate3.tag = 3003;
        
        txtTitle1.directionMaterial = placeholderDirection.placeholderUp
        txtMonth1.directionMaterial = placeholderDirection.placeholderUp
        txtYear1.directionMaterial = placeholderDirection.placeholderUp
        txtDate1.directionMaterial = placeholderDirection.placeholderUp
        
        txtTitle2.directionMaterial = placeholderDirection.placeholderUp
        txtMonth2.directionMaterial = placeholderDirection.placeholderUp
        txtYear2.directionMaterial = placeholderDirection.placeholderUp
        txtDate2.directionMaterial = placeholderDirection.placeholderUp
        
        txtTitle3.directionMaterial = placeholderDirection.placeholderUp
        txtMonth3.directionMaterial = placeholderDirection.placeholderUp
        txtYear3.directionMaterial = placeholderDirection.placeholderUp
        txtDate3.directionMaterial = placeholderDirection.placeholderUp
        
        txtTitle1.delegate = self;
        txtMonth1.delegate = self;
        txtYear1.delegate = self;
        txtDate1.delegate = self;
        
        txtTitle2.delegate = self;
        txtMonth2.delegate = self;
        txtYear2.delegate = self;
        txtDate2.delegate = self;
        
        txtTitle3.delegate = self;
        txtMonth3.delegate = self;
        txtYear3.delegate = self;
        txtDate3.delegate = self;
        
        tblMonth1.delegate = self;
        tblYear1.delegate = self;
        tblDate1.delegate = self;
        
        tblMonth2.delegate = self;
        tblYear2.delegate = self;
        tblDate2.delegate = self;
        
        tblMonth3.delegate = self;
        tblYear3.delegate = self;
        tblDate3.delegate = self;
        
        MonthBGView1.isHidden = true
        YearBGView1.isHidden = true
        DateBGView1.isHidden = true
       
        MonthBGView2.isHidden = true
        YearBGView2.isHidden = true
        DateBGView2.isHidden = true
        
        MonthBGView3.isHidden = true
        YearBGView3.isHidden = true
        DateBGView3.isHidden = true
        
        
        scrl_WidthConst.constant = self.view.frame.size.width
//        txtEventType1_widthConst.constant = self.view.frame.size.width - 60
        txtmonth1_withConst.constant = (self.view.frame.size.width - 95)/2
//        txtEventType1_widthConst2.constant = self.view.frame.size.width - 60
        txtmonth2_widthConst.constant = (self.view.frame.size.width - 95)/2
//        txtEventType1_widthConst3.constant = self.view.frame.size.width - 60
        txtmonth3_widthCont.constant = (self.view.frame.size.width - 95)/2
        
        btnBeforeSunset1.tag = 7011
        btnBeforeSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        
        btnBeforeSunset2.tag = 7021
        btnBeforeSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        
        btnBeforeSunset3.tag = 7031
        btnBeforeSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        
        
        let strCheckEmpt1 = UserDefaults.standard.object(forKey: "Conv_Date") as! String
        if UserDefaults.standard.object(forKey: "Conv_Date") != nil && strCheckEmpt1 != ""
        {
            txtDate1.text = UserDefaults.standard.string(forKey: "Conv_Date")!
            txtDate2.text = UserDefaults.standard.string(forKey: "Conv_Date")!
            txtDate3.text = UserDefaults.standard.string(forKey: "Conv_Date")!
            
            
            txtTitle1.text =  nil
            txtTitle2.text =  nil
            txtTitle3.text =  nil
            
            strD1 = txtDate1.text!
            strD2 = txtDate2.text!
            strD3 = txtDate3.text!
            
            
//            var dd1 = Int(txtDate1.text!)
//            dd1 = dd1!
//            strD1 = String(describing: dd1)
//
//            var dd2 = Int(txtDate2.text!)
//            dd2 = dd2!
//            strD2 = String(describing: dd2)
//
//            var dd3 = Int(txtDate3.text!)
//            dd3 = dd3!
//            strD3 = String(describing: dd3)
           
        }
        
        let strCheckEmpt2 = UserDefaults.standard.object(forKey: "Conv_Date") as! String
        if UserDefaults.standard.object(forKey: "Conv_Month") != nil && strCheckEmpt2 != ""
        {
            var strMonth = String()
            strMonth = UserDefaults.standard.string(forKey: "Conv_Month")!
            var month = Int(strMonth)
            
            if month == 1
            {
                txtMonth1.text = "January"
                txtMonth2.text = "January"
                txtMonth3.text = "January"
            }
           else if month == 2
            {
                txtMonth1.text = "February"
                txtMonth2.text = "February"
                txtMonth3.text = "February"
            }
            else if month == 3
            {
                txtMonth1.text = "March"
                txtMonth2.text = "March"
                txtMonth3.text = "March"
            }
            else if month == 4
            {
                txtMonth1.text = "April"
                txtMonth2.text = "April"
                txtMonth3.text = "April"
            }
            else if month == 5
            {
                txtMonth1.text = "May"
                txtMonth2.text = "May"
                txtMonth3.text = "May"
            }
            else if month == 6
            {
                txtMonth1.text = "June"
                txtMonth2.text = "June"
                txtMonth3.text = "June"
            }
            else if month == 7
            {
                txtMonth1.text = "July"
                txtMonth2.text = "July"
                txtMonth3.text = "July"
            }
            else if month == 8
            {
                txtMonth1.text = "August"
                txtMonth2.text = "August"
                txtMonth3.text = "August"
            }
            else if month == 9
            {
                txtMonth1.text = "September"
                txtMonth2.text = "September"
                txtMonth3.text = "September"
            }
            else if month == 10
            {
                txtMonth1.text = "October"
                txtMonth2.text = "October"
                txtMonth3.text = "October"
            }
            else if month == 11
            {
                txtMonth1.text = "November"
                txtMonth2.text = "November"
                txtMonth3.text = "November"
            }
            else if month == 12
            {
                txtMonth1.text = "December"
                txtMonth2.text = "December"
                txtMonth3.text = "December"
            }
            
            strM1 = strMonth
            strM2 = strMonth
            strM3 = strMonth
            
  
        }
        
        let strCheckEmpt3 = UserDefaults.standard.object(forKey: "Conv_Date") as! String
        if UserDefaults.standard.object(forKey: "Conv_Year") != nil && strCheckEmpt3 != ""
        {
            txtYear1.text = UserDefaults.standard.string(forKey: "Conv_Year")!
            txtYear2.text = UserDefaults.standard.string(forKey: "Conv_Year")!
            txtYear3.text = UserDefaults.standard.string(forKey: "Conv_Year")!
            
            strY1 = txtYear1.text
            strY2 = txtYear2.text
            strY3 = txtYear3.text
            
        }
        
        
        if UserDefaults.standard.object(forKey: "Conv_SunSet") != nil
        {
            isSunSet = UserDefaults.standard.bool(forKey: "Conv_SunSet")
            
            if(isSunSet == true )
            {
                isAfterSunSet1 = true
                btnBeforeSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                btnAfterSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                
                isAfterSunSet2 = true
                btnBeforeSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                btnAfterSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                
                isAfterSunSet3 = true
                btnBeforeSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                btnAfterSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
            }
            else
            {
                isAfterSunSet1 = false
                btnBeforeSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                btnAfterSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                
                isAfterSunSet2 = false
                btnBeforeSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                btnAfterSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
                
                isAfterSunSet3 = false
                btnBeforeSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
                btnAfterSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
            }
            
        }
        
    
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
//    override func viewWillAppear(_ animated: Bool)
    override func viewDidLayoutSubviews()
    {
        super.viewWillAppear(true)
        myLayout()
       
        // First View.......
        buttonMonth11 = UIButton(frame: CGRect(x: txtMonth1.frame.origin.x, y: txtMonth1.frame.origin.y, width: txtMonth1.frame.size.width, height: txtMonth1.frame.size.height))
        buttonMonth11.addTarget(self, action: #selector(buttonActionMonth1), for: .touchUpInside)
       
       self.FirstView.addSubview(buttonMonth11)
        
        buttonYear11 = UIButton(frame: CGRect(x: txtYear1.frame.origin.x, y: txtYear1.frame.origin.y, width:
            txtYear1.frame.size.width, height: txtYear1.frame.size.height))
        buttonYear11.addTarget(self, action: #selector(buttonActionYear1), for: .touchUpInside)
        self.FirstView.addSubview(buttonYear11)
        
        buttonDate11 = UIButton(frame: CGRect(x: txtDate1.frame.origin.x, y: txtDate1.frame.origin.y, width: txtDate1.frame.size.width, height: txtDate1.frame.size.height))
        buttonDate11.addTarget(self, action: #selector(buttonActionDate1), for: .touchUpInside)
        self.FirstView.addSubview(buttonDate11)
        

        
        let bottomTitleLine1 = UIView(frame: CGRect(x: txtTitle1.frame.origin.x, y: txtTitle1.frame.origin.y + txtTitle1.frame.size.height - 1, width: txtTitle1.frame.size.width, height: 1))
        bottomTitleLine1.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.FirstView.addSubview(bottomTitleLine1)
        
        let bottomMonthLine1 = UIView(frame: CGRect(x: txtMonth1.frame.origin.x, y: txtMonth1.frame.origin.y + txtMonth1.frame.size.height - 1, width: txtMonth1.frame.size.width, height: 1))
        bottomMonthLine1.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.FirstView.addSubview(bottomMonthLine1)
        
        let bottomYearLine1 = UIView(frame: CGRect(x: txtYear1.frame.origin.x, y: txtYear1.frame.origin.y + txtYear1.frame.size.height - 1, width: txtYear1.frame.size.width, height: 1))
        bottomYearLine1.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
       self.FirstView.addSubview(bottomYearLine1)
        
        let bottomDateLine1 = UIView(frame: CGRect(x: txtDate1.frame.origin.x, y: txtDate1.frame.origin.y + txtYear1.frame.size.height - 1, width: txtDate1.frame.size.width, height: 1))
        bottomDateLine1.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
       self.FirstView.addSubview(bottomDateLine1)
        
         buttonMonth11.tag = 5011
         buttonYear11.tag = 5012
         buttonDate11.tag = 5013
        
        
//        let firstViewBottomBoder = UIView(frame: CGRect(x: 0, y: self.FirstView.frame.origin.y + self.FirstView.frame.size.height, width: self.FirstView.frame.size.width, height: 2))
//        firstViewBottomBoder.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.srrlView?.addSubview(firstViewBottomBoder)
        
        
        FirstView?.layer.borderColor = UIColor.black.cgColor;
        FirstView?.layer.borderWidth = 1;
        FirstView?.layer.masksToBounds = true;
        
        txtTitle1.directionMaterial = placeholderDirection.placeholderUp
        txtMonth1.directionMaterial = placeholderDirection.placeholderUp
        txtYear1.directionMaterial = placeholderDirection.placeholderUp
        txtDate1.directionMaterial = placeholderDirection.placeholderUp
        
        
        
        // Second View.......
        buttonMonth22 = UIButton(frame: CGRect(x: txtMonth2.frame.origin.x, y: txtMonth2.frame.origin.y, width: txtMonth2.frame.size.width, height: txtMonth2.frame.size.height))
        buttonMonth22.addTarget(self, action: #selector(buttonActionMonth2), for: .touchUpInside)
        self.SecondView.addSubview(buttonMonth22)
        
        buttonYear22 = UIButton(frame: CGRect(x: txtYear2.frame.origin.x, y: txtYear2.frame.origin.y, width:txtYear2.frame.size.width, height: txtYear2.frame.size.height))
        buttonYear22.addTarget(self, action: #selector(buttonActionYear2), for: .touchUpInside)
        self.SecondView.addSubview(buttonYear22)
        
        buttonDate22 = UIButton(frame: CGRect(x: txtDate2.frame.origin.x, y: txtDate2.frame.origin.y, width: txtDate2.frame.size.width, height: txtDate2.frame.size.height))
        buttonDate22.addTarget(self, action: #selector(buttonActionDate2), for: .touchUpInside)
        self.SecondView.addSubview(buttonDate22)
        

        
        let bottomTitleLine2 = UIView(frame: CGRect(x: txtTitle2.frame.origin.x, y: txtTitle2.frame.origin.y + txtTitle2.frame.size.height - 1, width: txtTitle2.frame.size.width, height: 1))
        bottomTitleLine2.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.SecondView.addSubview(bottomTitleLine2)
        
        let bottomMonthLine2 = UIView(frame: CGRect(x: txtMonth2.frame.origin.x, y: txtMonth2.frame.origin.y + txtMonth2.frame.size.height - 1, width: txtMonth2.frame.size.width, height: 1))
        bottomMonthLine2.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.SecondView.addSubview(bottomMonthLine2)
        
        let bottomYearLine2 = UIView(frame: CGRect(x: txtYear2.frame.origin.x, y: txtYear2.frame.origin.y + txtYear2.frame.size.height - 1, width: txtYear2.frame.size.width, height: 1))
        bottomYearLine2.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.SecondView.addSubview(bottomYearLine2)
        
        let bottomDateLine2 = UIView(frame: CGRect(x: txtDate2.frame.origin.x, y: txtDate2.frame.origin.y + txtYear2.frame.size.height - 1, width: txtDate2.frame.size.width, height: 1))
        bottomDateLine2.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.SecondView.addSubview(bottomDateLine2)
        
        buttonMonth22.tag = 5021
        buttonYear22.tag = 5022
        buttonDate22.tag = 5023
        
//        let secoundViewBottomBoder = UIView(frame: CGRect(x: 0, y: self.SecondView.frame.origin.y + self.SecondView.frame.size.height, width: self.SecondView.frame.size.width, height: 2))
//        secoundViewBottomBoder.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.srrlView?.addSubview(secoundViewBottomBoder)
        SecondView?.layer.borderColor = UIColor.black.cgColor;
        SecondView?.layer.borderWidth = 1;
        SecondView?.layer.masksToBounds = true;
        
        txtTitle2.directionMaterial = placeholderDirection.placeholderUp
        txtMonth2.directionMaterial = placeholderDirection.placeholderUp
        txtYear2.directionMaterial = placeholderDirection.placeholderUp
        txtDate2.directionMaterial = placeholderDirection.placeholderUp
        
        
    ///Third View.....
        buttonMonth33 = UIButton(frame: CGRect(x: txtMonth3.frame.origin.x, y: txtMonth3.frame.origin.y, width: txtMonth3.frame.size.width, height: txtMonth3.frame.size.height))
        buttonMonth33.addTarget(self, action: #selector(buttonActionMonth3), for: .touchUpInside)
        self.ThirdView.addSubview(buttonMonth33)
        
        buttonYear33 = UIButton(frame: CGRect(x: txtYear3.frame.origin.x, y: txtYear3.frame.origin.y, width:txtYear3.frame.size.width, height: txtYear3.frame.size.height))
        buttonYear33.addTarget(self, action: #selector(buttonActionYear3), for: .touchUpInside)
        self.ThirdView.addSubview(buttonYear33)
        
        buttonDate33 = UIButton(frame: CGRect(x: txtDate3.frame.origin.x, y: txtDate3.frame.origin.y, width: txtDate3.frame.size.width, height: txtDate3.frame.size.height))
        buttonDate33.addTarget(self, action: #selector(buttonActionDate3), for: .touchUpInside)
        self.ThirdView.addSubview(buttonDate33)
        

        
        let bottomTitleLine3 = UIView(frame: CGRect(x: txtTitle3.frame.origin.x, y: txtTitle3.frame.origin.y + txtTitle3.frame.size.height - 1, width: txtTitle3.frame.size.width, height: 1))
        bottomTitleLine3.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.ThirdView.addSubview(bottomTitleLine3)
        
        let bottomMonthLine3 = UIView(frame: CGRect(x: txtMonth3.frame.origin.x, y: txtMonth3.frame.origin.y + txtMonth3.frame.size.height - 1, width: txtMonth3.frame.size.width, height: 1))
        bottomMonthLine3.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.ThirdView.addSubview(bottomMonthLine3)
        
        let bottomYearLine3 = UIView(frame: CGRect(x: txtYear3.frame.origin.x, y: txtYear3.frame.origin.y + txtYear3.frame.size.height - 1, width: txtYear3.frame.size.width, height: 1))
        bottomYearLine3.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.ThirdView.addSubview(bottomYearLine3)
        
        let bottomDateLine3 = UIView(frame: CGRect(x: txtDate3.frame.origin.x, y: txtDate3.frame.origin.y + txtYear3.frame.size.height - 1, width: txtDate3.frame.size.width, height: 1))
        bottomDateLine3.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.ThirdView.addSubview(bottomDateLine3)
       
        buttonMonth33.tag = 5031
        buttonYear33.tag = 5032
        buttonDate33.tag = 5033
        
//        let thirdViewBottomBoder = UIView(frame: CGRect(x: 0, y: self.ThirdView.frame.origin.y + self.ThirdView.frame.size.height, width: self.ThirdView.frame.size.width, height: 2))
//        thirdViewBottomBoder.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.srrlView? .addSubview(thirdViewBottomBoder)
        
        ThirdView?.layer.borderColor = UIColor.black.cgColor;
        ThirdView?.layer.borderWidth = 1;
        ThirdView?.layer.masksToBounds = true;
        
        txtTitle3.directionMaterial = placeholderDirection.placeholderUp
        txtMonth3.directionMaterial = placeholderDirection.placeholderUp
        txtYear3.directionMaterial = placeholderDirection.placeholderUp
        txtDate3.directionMaterial = placeholderDirection.placeholderUp
        
        
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
        
        srrlView?.contentSize = CGSize(width: self.view.frame.size.width, height: 585)
        srrlView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        

    }
    
    func myBackGraound(strmonth: NSInteger)
    {
        let strimagename = "commanHeader" + "\(strmonth)"
        CustomHeaderImage.image = UIImage(named: strimagename)
        
    }
    
    
    @IBAction func btnCancel(_ sender: UIButton)
    {
        UserDefaults.standard.set("", forKey: "Conv_Date")
        UserDefaults.standard.set("", forKey: "Conv_Month")
        UserDefaults.standard.set("", forKey: "Conv_Year")
        UserDefaults.standard.set("", forKey: "Conv_SunSet")

         self .dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSunSet1(_ sender: UIButton)
    {
        if sender.tag == 7012
        {
            isAfterSunSet1 = true
           // btnBeforeSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
           // btnBeforeSunset1.backgroundColor = UIColor.red
            btnBeforeSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
            btnAfterSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        }
        else
        {
            isAfterSunSet1 = false
            btnBeforeSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
            btnAfterSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        }
    }

    
    @IBAction func btnSunSet2(_ sender: UIButton)
    {
        if sender.tag == 7022
        {
            isAfterSunSet2 = true
            btnBeforeSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
            btnAfterSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        }
        else
        {
            isAfterSunSet2 = false
            btnBeforeSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
            btnAfterSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        }
    }

    
    @IBAction func btnSunSet3(_ sender: UIButton)
    {
        if sender.tag == 7032
        {
            isAfterSunSet3 = true
            btnBeforeSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
            btnAfterSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        }
        else
        {
            isAfterSunSet3 = false
            btnBeforeSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
            btnAfterSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        }
    }

  
  
  //////............. First view...............
    func buttonActionMonth1()
    {
        if buttonMonth11.tag == 5011
        {
            self.view .endEditing(true)
            MonthBGView1.isHidden = false
            YearBGView1.isHidden = true
            DateBGView1.isHidden = true
            MonthBGView2.isHidden = true
            YearBGView2.isHidden = true
            DateBGView2.isHidden = true
            MonthBGView3.isHidden = true
            YearBGView3.isHidden = true
            DateBGView3.isHidden = true
        
            tblMonth1.reloadData()
            arrow_month1.image = UIImage(named: "UP_arrow")
            arrow_Year1.image = UIImage(named: "Down_arrow")
            arrow_Day1.image = UIImage(named: "Down_arrow")
            arrow_month2.image = UIImage(named: "Down_arrow")
            arrow_Year2.image = UIImage(named: "Down_arrow")
            arrow_Day2.image = UIImage(named: "Down_arrow")
            arrow_month3.image = UIImage(named: "Down_arrow")
            arrow_Year3.image = UIImage(named: "Down_arrow")
            arrow_Day3.image = UIImage(named: "Down_arrow")

            buttonMonth11.tag = 6011
            buttonYear11.tag = 5012
            buttonDate11.tag = 5013
            buttonMonth22.tag = 5021
            buttonYear22.tag = 5022
            buttonDate22.tag = 5023
            buttonMonth33.tag = 5031
            buttonYear33.tag = 5032
            buttonDate33.tag = 5033
        }
        else
        {
            hidden()
        }
    
    }
    
    func buttonActionYear1()
    {
        if  buttonYear11.tag == 5012
        {
            self.view .endEditing(true)
            MonthBGView1.isHidden = true
            YearBGView1.isHidden = false
            DateBGView1.isHidden = true
            MonthBGView2.isHidden = true
            YearBGView2.isHidden = true
            DateBGView2.isHidden = true
            MonthBGView3.isHidden = true
            YearBGView3.isHidden = true
            DateBGView3.isHidden = true
            tblYear1.reloadData()
            
            arrow_month1.image = UIImage(named: "Down_arrow")
            arrow_Year1.image = UIImage(named: "UP_arrow")
            arrow_Day1.image = UIImage(named: "Down_arrow")
            arrow_month2.image = UIImage(named: "Down_arrow")
            arrow_Year2.image = UIImage(named: "Down_arrow")
            arrow_Day2.image = UIImage(named: "Down_arrow")
            arrow_month3.image = UIImage(named: "Down_arrow")
            arrow_Year3.image = UIImage(named: "Down_arrow")
            arrow_Day3.image = UIImage(named: "Down_arrow")

            buttonMonth11.tag = 5011
            buttonYear11.tag = 6012
            buttonDate11.tag = 5013
            buttonMonth22.tag = 5021
            buttonYear22.tag = 5022
            buttonDate22.tag = 5023
            buttonMonth33.tag = 5031
            buttonYear33.tag = 5032
            buttonDate33.tag = 5033

        }
        else
        {
            hidden()
        }
    }
    
    func buttonActionDate1()
    {
        if buttonDate11.tag == 5013
        {
            self.view .endEditing(true)
            MonthBGView1.isHidden = true
            YearBGView1.isHidden = true
            DateBGView1.isHidden = false
            MonthBGView2.isHidden = true
            YearBGView2.isHidden = true
            DateBGView2.isHidden = true
            MonthBGView3.isHidden = true
            YearBGView3.isHidden = true
            DateBGView3.isHidden = true
            tblDate1.reloadData()
        
            arrow_month1.image = UIImage(named: "Down_arrow")
            arrow_Year1.image = UIImage(named: "Down_arrow")
            arrow_Day1.image = UIImage(named: "UP_arrow")
            arrow_month2.image = UIImage(named: "Down_arrow")
            arrow_Year2.image = UIImage(named: "Down_arrow")
            arrow_Day2.image = UIImage(named: "Down_arrow")
            arrow_month3.image = UIImage(named: "Down_arrow")
            arrow_Year3.image = UIImage(named: "Down_arrow")
            arrow_Day3.image = UIImage(named: "Down_arrow")

            buttonMonth11.tag = 5011
            buttonYear11.tag = 5012
            buttonDate11.tag = 6013
            buttonMonth22.tag = 5021
            buttonYear22.tag = 5022
            buttonDate22.tag = 5023
            buttonMonth33.tag = 5031
            buttonYear33.tag = 5032
            buttonDate33.tag = 5033
        }
        else
        {
            hidden()
        }
    }

    
     ///////////  Second View...................................
    
    func buttonActionMonth2()
    {
            if buttonMonth22.tag == 5021
            {
                self.view .endEditing(true)
                MonthBGView1.isHidden = true
                YearBGView1.isHidden = true
                DateBGView1.isHidden = true
                MonthBGView2.isHidden = false
                YearBGView2.isHidden = true
                DateBGView2.isHidden = true
                MonthBGView3.isHidden = true
                YearBGView3.isHidden = true
                DateBGView3.isHidden = true
                tblMonth2.reloadData()
        
                arrow_month1.image = UIImage(named: "Down_arrow")
                arrow_Year1.image = UIImage(named: "Down_arrow")
                arrow_Day1.image = UIImage(named: "Down_arrow")
                arrow_month2.image = UIImage(named: "UP_arrow")
                arrow_Year2.image = UIImage(named: "Down_arrow")
                arrow_Day2.image = UIImage(named: "Down_arrow")
                arrow_month3.image = UIImage(named: "Down_arrow")
                arrow_Year3.image = UIImage(named: "Down_arrow")
                arrow_Day3.image = UIImage(named: "Down_arrow")
                buttonMonth11.tag = 5011
                buttonYear11.tag = 5012
                buttonDate11.tag = 5013
                buttonMonth22.tag = 6021
                buttonYear22.tag = 5022
                buttonDate22.tag = 5023
                buttonMonth33.tag = 5031
                buttonYear33.tag = 5032
                buttonDate33.tag = 5033
            }
            else
            {
                hidden()
            }
    }
    
    func buttonActionYear2()
    {
        if  buttonYear22.tag == 5022
            {
                self.view .endEditing(true)
                MonthBGView1.isHidden = true
                YearBGView1.isHidden = true
                DateBGView1.isHidden = true
                MonthBGView2.isHidden = true
                YearBGView2.isHidden = false
                DateBGView2.isHidden = true
                MonthBGView3.isHidden = true
                YearBGView3.isHidden = true
                DateBGView3.isHidden = true
                tblYear2.reloadData()
        
                arrow_month1.image = UIImage(named: "Down_arrow")
                arrow_Year1.image = UIImage(named: "Down_arrow")
                arrow_Day1.image = UIImage(named: "Down_arrow")
                arrow_month2.image = UIImage(named: "Down_arrow")
                arrow_Year2.image = UIImage(named: "UP_arrow")
                arrow_Day2.image = UIImage(named: "Down_arrow")
                arrow_month3.image = UIImage(named: "Down_arrow")
                arrow_Year3.image = UIImage(named: "Down_arrow")
                arrow_Day3.image = UIImage(named: "Down_arrow")
                buttonMonth11.tag = 5011
                buttonYear11.tag = 5012
                buttonDate11.tag = 5013
                buttonMonth22.tag = 5021
                buttonYear22.tag = 6022
                buttonDate22.tag = 5023
                buttonMonth33.tag = 5031
                buttonYear33.tag = 5032
                buttonDate33.tag = 5033
            }
            else
            {
               hidden()
            }
        
    }
    
    
   
    func buttonActionDate2()
    {
        if buttonDate22.tag == 5023
            {
                self.view .endEditing(true)
                MonthBGView1.isHidden = true
                YearBGView1.isHidden = true
                DateBGView1.isHidden = true
                MonthBGView2.isHidden = true
                YearBGView2.isHidden = true
                DateBGView2.isHidden = false
                MonthBGView3.isHidden = true
                YearBGView3.isHidden = true
                DateBGView3.isHidden = true
                tblDate2.reloadData()
  
                arrow_month1.image = UIImage(named: "Down_arrow")
                arrow_Year1.image = UIImage(named: "Down_arrow")
                arrow_Day1.image = UIImage(named: "Down_arrow")
                arrow_month2.image = UIImage(named: "Down_arrow")
                arrow_Year2.image = UIImage(named: "Down_arrow")
                arrow_Day2.image = UIImage(named: "UP_arrow")
                arrow_month3.image = UIImage(named: "Down_arrow")
                arrow_Year3.image = UIImage(named: "Down_arrow")
                arrow_Day3.image = UIImage(named: "Down_arrow")
                buttonMonth11.tag = 5011
                buttonYear11.tag = 5012
                buttonDate11.tag = 5013
                buttonMonth22.tag = 5021
                buttonYear22.tag = 5022
                buttonDate22.tag = 6023
                buttonMonth33.tag = 5031
                buttonYear33.tag = 5032
                buttonDate33.tag = 5033
            }
            else
            {
                hidden()
        }
        
    }
    
    
    ///////////  Third View...................................
    
    func buttonActionMonth3()
    {
        if buttonMonth33.tag == 5031
            {
                self.view .endEditing(true)
                MonthBGView1.isHidden = true
                YearBGView1.isHidden = true
                DateBGView1.isHidden = true
                MonthBGView2.isHidden = true
                YearBGView2.isHidden = true
                DateBGView2.isHidden = true
                MonthBGView3.isHidden = false
                YearBGView3.isHidden = true
                DateBGView3.isHidden = true
                tblMonth3.reloadData()
        
                arrow_month1.image = UIImage(named: "Down_arrow")
                arrow_Year1.image = UIImage(named: "Down_arrow")
                arrow_Day1.image = UIImage(named: "Down_arrow")
                arrow_month2.image = UIImage(named: "Down_arrow")
                arrow_Year2.image = UIImage(named: "Down_arrow")
                arrow_Day2.image = UIImage(named: "Down_arrow")
                arrow_month3.image = UIImage(named: "UP_arrow")
                arrow_Year3.image = UIImage(named: "Down_arrow")
                arrow_Day3.image = UIImage(named: "Down_arrow")
                buttonMonth11.tag = 5011
                buttonYear11.tag = 5012
                buttonDate11.tag = 5013
                buttonMonth22.tag = 5021
                buttonYear22.tag = 5022
                buttonDate22.tag = 5023
                buttonMonth33.tag = 6031
                buttonYear33.tag = 5032
                buttonDate33.tag = 5033
            }
            else
            {
                hidden()
            }
        
    }
    
    func buttonActionYear3()
    {
          if  buttonYear33.tag == 5032
            {
                self.view .endEditing(true)
                MonthBGView1.isHidden = true
                YearBGView1.isHidden = true
                DateBGView1.isHidden = true
                MonthBGView2.isHidden = true
                YearBGView2.isHidden = true
                DateBGView2.isHidden = true
                MonthBGView3.isHidden = true
                YearBGView3.isHidden = false
                DateBGView3.isHidden = true
                tblYear3.reloadData()
        
                arrow_month1.image = UIImage(named: "Down_arrow")
                arrow_Year1.image = UIImage(named: "Down_arrow")
                arrow_Day1.image = UIImage(named: "Down_arrow")
                arrow_month2.image = UIImage(named: "Down_arrow")
                arrow_Year2.image = UIImage(named: "Down_arrow")
                arrow_Day2.image = UIImage(named: "Down_arrow")
                arrow_month3.image = UIImage(named: "Down_arrow")
                arrow_Year3.image = UIImage(named: "UP_arrow")
                arrow_Day3.image = UIImage(named: "Down_arrow")
                buttonMonth11.tag = 5011
                buttonYear11.tag = 5012
                buttonDate11.tag = 5013
                buttonMonth22.tag = 5021
                buttonYear22.tag = 5022
                buttonDate22.tag = 5023
                buttonMonth33.tag = 5031
                buttonYear33.tag = 6032
                buttonDate33.tag = 5033
        
        
            }
            else
            {
                hidden()
             }
    }
    
    
    
    func buttonActionDate3()
    {
         if buttonDate33.tag == 5033
           {
            self.view .endEditing(true)
            MonthBGView1.isHidden = true
            YearBGView1.isHidden = true
            DateBGView1.isHidden = true
            MonthBGView2.isHidden = true
            YearBGView2.isHidden = true
            DateBGView2.isHidden = true
            MonthBGView3.isHidden = true
            YearBGView3.isHidden = true
            DateBGView3.isHidden = false
            tblDate3.reloadData()
        
            arrow_month1.image = UIImage(named: "Down_arrow")
            arrow_Year1.image = UIImage(named: "Down_arrow")
            arrow_Day1.image = UIImage(named: "Down_arrow")
            arrow_month2.image = UIImage(named: "Down_arrow")
            arrow_Year2.image = UIImage(named: "Down_arrow")
            arrow_Day2.image = UIImage(named: "Down_arrow")
            arrow_month3.image = UIImage(named: "Down_arrow")
            arrow_Year3.image = UIImage(named: "Down_arrow")
            arrow_Day3.image = UIImage(named: "UP_arrow")
            buttonMonth11.tag = 5011
            buttonYear11.tag = 5012
            buttonDate11.tag = 5013
            buttonMonth22.tag = 5021
            buttonYear22.tag = 5022
            buttonDate22.tag = 5023
            buttonMonth33.tag = 5031
            buttonYear33.tag = 5032
            buttonDate33.tag = 6033
        }
        else
        {
            hidden()
        }
    }

    
    func hidden()
    {
        self.view .endEditing(true)
        MonthBGView1.isHidden = true
        YearBGView1.isHidden = true
        DateBGView1.isHidden = true
        MonthBGView2.isHidden = true
        YearBGView2.isHidden = true
        DateBGView2.isHidden = true
        MonthBGView3.isHidden = true
        YearBGView3.isHidden = true
        DateBGView3.isHidden = true
        tblMonth1.reloadData()
        arrow_month1.image = UIImage(named: "Down_arrow")
        arrow_Year1.image = UIImage(named: "Down_arrow")
        arrow_Day1.image = UIImage(named: "Down_arrow")
        arrow_month2.image = UIImage(named: "Down_arrow")
        arrow_Year2.image = UIImage(named: "Down_arrow")
        arrow_Day2.image = UIImage(named: "Down_arrow")
        arrow_month3.image = UIImage(named: "Down_arrow")
        arrow_Year3.image = UIImage(named: "Down_arrow")
        arrow_Day3.image = UIImage(named: "Down_arrow")
        
        buttonMonth11.tag = 5011
        buttonYear11.tag = 5012
        buttonDate11.tag = 5013
        buttonMonth22.tag = 5021
        buttonYear22.tag = 5022
        buttonDate22.tag = 5023
        buttonMonth33.tag = 5031
        buttonYear33.tag = 5032
        buttonDate33.tag = 5033
    }
    
    func hiddenFromtext()
    {
        MonthBGView1.isHidden = true
        YearBGView1.isHidden = true
        DateBGView1.isHidden = true
        MonthBGView2.isHidden = true
        YearBGView2.isHidden = true
        DateBGView2.isHidden = true
        MonthBGView3.isHidden = true
        YearBGView3.isHidden = true
        DateBGView3.isHidden = true
        tblMonth1.reloadData()
        arrow_month1.image = UIImage(named: "Down_arrow")
        arrow_Year1.image = UIImage(named: "Down_arrow")
        arrow_Day1.image = UIImage(named: "Down_arrow")
        arrow_month2.image = UIImage(named: "Down_arrow")
        arrow_Year2.image = UIImage(named: "Down_arrow")
        arrow_Day2.image = UIImage(named: "Down_arrow")
        arrow_month3.image = UIImage(named: "Down_arrow")
        arrow_Year3.image = UIImage(named: "Down_arrow")
        arrow_Day3.image = UIImage(named: "Down_arrow")
        
        buttonMonth11.tag = 5011
        buttonYear11.tag = 5012
        buttonDate11.tag = 5013
        buttonMonth22.tag = 5021
        buttonYear22.tag = 5022
        buttonDate22.tag = 5023
        buttonMonth33.tag = 5031
        buttonYear33.tag = 5032
        buttonDate33.tag = 5033
    }
    
    
    
    func  textFieldDidBeginEditing(_ textField: UITextField)
    {
        hiddenFromtext()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return false
    }
    
    
    
    func myLayout()
    {
       
        ////// first view ..............
        MonthBGView1.frame = CGRect(x: txtMonth1.frame.origin.x, y: txtMonth1.frame.origin.y+txtMonth1.frame.size.height, width: txtMonth1.frame.size.width, height: CGFloat(44 * 5))
        
        YearBGView1.frame = CGRect(x: txtYear1.frame.origin.x, y: txtYear1.frame.origin.y+txtYear1.frame.size.height, width: txtYear1.frame.size.width, height: CGFloat(44 * 5))
        
        DateBGView1.frame = CGRect(x: txtDate1.frame.origin.x, y: txtDate1.frame.origin.y+txtDate1.frame.size.height, width: txtDate1.frame.size.width, height: CGFloat(44 * 5))
  
        tblMonth1.frame = CGRect(x: 0, y: 0, width: MonthBGView1.frame.size.width, height: MonthBGView1.frame.size.height)
        tblYear1.frame = CGRect(x: 0, y: 0, width: YearBGView1.frame.size.width, height: YearBGView1.frame.size.height)
        tblDate1.frame = CGRect(x: 0, y: 0, width: DateBGView1.frame.size.width, height: DateBGView1.frame.size.height)
        
        let layer1 = MonthBGView1.layer
        layer1.shadowColor = UIColor.black.cgColor
        layer1.shadowOffset = CGSize(width: 0, height: 10)
        layer1.shadowOpacity = 0.8
        layer1.shadowRadius = 7
        
        let layer2 = YearBGView1.layer
        layer2.shadowColor = UIColor.black.cgColor
        layer2.shadowOffset = CGSize(width: 0, height: 10)
        layer2.shadowOpacity = 0.8
        layer2.shadowRadius = 7
        
        let layer3 = DateBGView1.layer
        layer3.shadowColor = UIColor.black.cgColor
        layer3.shadowOffset = CGSize(width: 0, height: 10)
        layer3.shadowOpacity = 0.8
        layer3.shadowRadius = 7
        
        
        //////// second View ............
        MonthBGView2.frame = CGRect(x: txtMonth2.frame.origin.x, y: SecondView.frame.origin.y + txtMonth2.frame.origin.y + txtMonth2.frame.size.height, width: txtMonth2.frame.size.width, height:CGFloat(44 * 5))
        
        YearBGView2.frame = CGRect(x: txtYear2.frame.origin.x, y: SecondView.frame.origin.y + txtYear2.frame.origin.y + txtYear2.frame.size.height, width: txtYear2.frame.size.width, height: CGFloat(44 * 5))
        
        DateBGView2.frame = CGRect(x: txtDate2.frame.origin.x, y: SecondView.frame.origin.y + txtDate2.frame.origin.y + txtDate2.frame.size.height, width: txtDate2.frame.size.width, height: CGFloat(44 * 5))
        
        tblMonth2.frame = CGRect(x: 0, y: 0, width: MonthBGView2.frame.size.width, height: MonthBGView2.frame.size.height)
        tblYear2.frame = CGRect(x: 0, y: 0, width: YearBGView2.frame.size.width, height: YearBGView2.frame.size.height)
        tblDate2.frame = CGRect(x: 0, y: 0, width: DateBGView2.frame.size.width, height: DateBGView2.frame.size.height)
        
        let layer12 = MonthBGView2.layer
        layer12.shadowColor = UIColor.black.cgColor
        layer12.shadowOffset = CGSize(width: 0, height: 10)
        layer12.shadowOpacity = 0.8
        layer12.shadowRadius = 7
        
        let layer22 = YearBGView2.layer
        layer22.shadowColor = UIColor.black.cgColor
        layer22.shadowOffset = CGSize(width: 0, height: 10)
        layer22.shadowOpacity = 0.8
        layer22.shadowRadius = 7
        
        let layer32 = DateBGView2.layer
        layer32.shadowColor = UIColor.black.cgColor
        layer32.shadowOffset = CGSize(width: 0, height: 10)
        layer32.shadowOpacity = 0.8
        layer32.shadowRadius = 7
        
        
        ///////// thired view.......
        if self.view.frame.size.height - ( MainView.frame.origin.y +  ThirdView.frame.origin.y + txtMonth3.frame.origin.y + txtMonth3.frame.size.height) >= 270
        {
            MonthBGView3.frame = CGRect(x: txtMonth3.frame.origin.x, y: ThirdView.frame.origin.y + txtMonth3.frame.origin.y + txtMonth3.frame.size.height, width: txtMonth3.frame.size.width, height: CGFloat(44 * 5))
            
            YearBGView3.frame = CGRect(x: txtYear3.frame.origin.x, y: ThirdView.frame.origin.y + txtYear3.frame.origin.y + txtYear3.frame.size.height, width: txtYear3.frame.size.width, height: CGFloat(44 * 5))
            
            DateBGView3.frame = CGRect(x: txtDate3.frame.origin.x, y: ThirdView.frame.origin.y + txtDate3.frame.origin.y + txtDate3.frame.size.height, width: txtDate3.frame.size.width, height: CGFloat(44 * 5))
        }
        else
        {
            
            MonthBGView3.frame = CGRect(x: txtMonth3.frame.origin.x, y: ThirdView.frame.origin.y + txtMonth3.frame.origin.y + txtMonth3.frame.size.height - CGFloat(44 * 6), width: txtMonth3.frame.size.width, height: CGFloat(44 * 5))
            
            YearBGView3.frame = CGRect(x: txtYear3.frame.origin.x, y: ThirdView.frame.origin.y + txtYear3.frame.origin.y + txtYear3.frame.size.height - CGFloat(44 * 6), width: txtYear3.frame.size.width, height: CGFloat(44 * 5))
            
            DateBGView3.frame = CGRect(x: txtDate3.frame.origin.x, y: ThirdView.frame.origin.y + txtDate3.frame.origin.y + txtDate3.frame.size.height - CGFloat(44 * 6), width: txtDate3.frame.size.width, height: CGFloat(44 * 5))
        }
        

        
        tblMonth3.frame = CGRect(x: 0, y: 0, width: MonthBGView3.frame.size.width, height: MonthBGView3.frame.size.height)
        tblYear3.frame = CGRect(x: 0, y: 0, width: YearBGView3.frame.size.width, height: YearBGView3.frame.size.height)
        tblDate3.frame = CGRect(x: 0, y: 0, width: DateBGView3.frame.size.width, height: DateBGView3.frame.size.height)
        
        let layer13 = MonthBGView3.layer
        layer13.shadowColor = UIColor.black.cgColor
        layer13.shadowOffset = CGSize(width: 0, height: 10)
        layer13.shadowOpacity = 0.8
        layer13.shadowRadius = 7
        
        let layer23 = YearBGView3.layer
        layer23.shadowColor = UIColor.black.cgColor
        layer23.shadowOffset = CGSize(width: 0, height: 10)
        layer23.shadowOpacity = 0.8
        layer23.shadowRadius = 7
        
        let layer33 = DateBGView3.layer
        layer33.shadowColor = UIColor.black.cgColor
        layer33.shadowOffset = CGSize(width: 0, height: 10)
        layer33.shadowOpacity = 0.8
        layer33.shadowRadius = 7
        
    }
    
    
    
    
    
    @IBAction func btnConvertDate(_ sender: UIButton)
    {
        self.view .endEditing(true)
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 1001 || tableView.tag == 2001 || tableView.tag == 3001
        {
            return arrMonthGregion.count;
        }
        else if tableView.tag == 1002 || tableView.tag == 2002 || tableView.tag == 3002
        {
            return arrYearGregion.count
        }
        else if tableView.tag == 1003 || tableView.tag == 2003 || tableView.tag == 3003
        {
            return arrDate.count
        }
        else
        {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "dateCustonCell"
        let cell: dateCustonCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? dateCustonCell
        //        if cell == nil
        //        {
        //             tableView.register(UINib(nibName: "dateOneCell", bundle: nil), forCellReuseIdentifier: identifier)
        //        }
        
//                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? dateOneCell
        if tableView.tag == 1001
        {
            cell.lblTitle.text = arrMonthGregion[indexPath.row];
        }
        else if tableView.tag == 1002
        {
            cell.lblTitle.text = arrYearGregion[indexPath.row];
        }
        else if tableView.tag == 1003
        {
            cell.lblTitle.text = arrDate[indexPath.row];
        }
        if tableView.tag == 2001
        {
            cell.lblTitle.text = arrMonthGregion[indexPath.row];
        }
        else if tableView.tag == 2002
        {
            cell.lblTitle.text = arrYearGregion[indexPath.row];
        }
        else if tableView.tag == 2003
        {
            cell.lblTitle.text = arrDate[indexPath.row];
        }
        if tableView.tag == 3001
        {
            cell.lblTitle.text = arrMonthGregion[indexPath.row];
        }
        else if tableView.tag == 3002
        {
            cell.lblTitle.text = arrYearGregion[indexPath.row];
        }
        else if tableView.tag == 3003
        {
            cell.lblTitle.text = arrDate[indexPath.row];
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.tag == 1001
        {
            txtMonth1.text = arrMonthGregion[indexPath.row];
            MonthBGView1.isHidden = true;
            txtMonth1.textFieldDidChange()
            strM1 = String (describing: indexPath.row + 1)
        }
        else if tableView.tag == 1002
        {
            txtYear1.text = arrYearGregion[indexPath.row];
            YearBGView1.isHidden = true;
            txtYear1.textFieldDidChange()
            strY1 = txtYear1.text
        }
        else if tableView.tag == 1003
        {
            txtDate1.text = arrDate[indexPath.row];
            DateBGView1.isHidden = true
            txtDate1.textFieldDidChange()
            if isAfterSunSet1 == true
            {
                var dd = Int(txtDate1.text!)
                dd = dd! + 1
                strD1 = String(describing: dd)
            }
            else
            {
                strD1 = txtDate1.text
            }
        }
        if tableView.tag == 2001
        {
            txtMonth2.text = arrMonthGregion[indexPath.row];
            MonthBGView2.isHidden = true;
            txtMonth2.textFieldDidChange()
            strM2 = String (describing: indexPath.row + 1)
        }
        else if tableView.tag == 2002
        {
            txtYear2.text = arrYearGregion[indexPath.row];
            YearBGView2.isHidden = true;
            txtYear2.textFieldDidChange()
            strY2 = txtYear2.text
        }
        else if tableView.tag == 2003
        {
            txtDate2.text = arrDate[indexPath.row];
            DateBGView2.isHidden = true
            txtDate2.textFieldDidChange()
            if isAfterSunSet2 == true
            {
                var dd = Int(txtDate2.text!)
                dd = dd! + 1
                strD2 = String(describing: dd)
            }
            else
            {
                strD2 = txtDate2.text
            }
        }
        if tableView.tag == 3001
        {
            txtMonth3.text = arrMonthGregion[indexPath.row];
            MonthBGView3.isHidden = true;
            txtMonth3.textFieldDidChange()
            strM3 = String (describing: indexPath.row + 1)
        }
        else if tableView.tag == 3002
        {
            txtYear3.text = arrYearGregion[indexPath.row];
            YearBGView3.isHidden = true;
            txtYear3.textFieldDidChange()
            strY3 = txtYear3.text
        }
        else if tableView.tag == 3003
        {
            txtDate3.text = arrDate[indexPath.row];
            DateBGView3.isHidden = true
            txtDate3.textFieldDidChange()
            if isAfterSunSet3 == true
            {
                var dd = Int(txtDate3.text!)
                dd = dd! + 1
                strD3 = String(describing: dd)
            }
            else
            {
                strD3 = txtDate3.text
            }
        }
      hidden()
    }
    

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
        arrMyEvents.removeAllObjects();
        loaddata()
        

    }
    
    
    
    func loaddata()
    {
        strTxtTitle1 = txtTitle1.text!
        
        if (strM1 != nil  && strY1 != nil && strD1 != nil)
        {
        
            if (strM1 != nil  && strY1 != nil && strD1 != nil && strTxtTitle1 != nil && strTxtTitle1.characters.count > 0)
            {
                let dic = NSMutableDictionary()
                if strM1 != nil  && strY1 != nil && strD1 != nil
                {
                    dic .setObject(txtTitle1.text!, forKey: "evTitle" as NSCopying);
                    dic .setObject(strM1, forKey: "evMonth" as NSCopying);
                    dic .setObject(strY1, forKey: "evYear" as NSCopying);
                    dic .setObject(strD1, forKey: "evDate" as NSCopying);
                }
                arrMyEvents .add(dic)
            }
            else
            {
                let alert = UIAlertView()
                    if strTxtTitle1.characters.count <= 0
                    {
                        alert.message = "Please select title"
                        alert.addButton(withTitle: "OK")
                        alert.show()
                        return
                    }
                    else if strM1 == nil
                    {
                        alert.message = "Please select month"
                        alert.addButton(withTitle: "OK")
                        alert.show()
                        return
                    }
                    else if strY1 == nil
                    {
                        alert.message = "Please select year"
                        alert.addButton(withTitle: "OK")
                        alert.show()
                        return
                    }
                    else if strD1 == nil
                    {
                        alert.message = "Please select date"
                        alert.addButton(withTitle: "OK")
                        alert.show()
                        return
                    }
                }
            }
       
        
        strTxtTitle2 = txtTitle2.text!
      
       if (strM2 != nil  && strY2 != nil && strD2 != nil)
        {
            if (strM2 != nil  && strY2 != nil && strD2 != nil && strTxtTitle2 != nil && strTxtTitle2.characters.count > 0)
            {
                let dic = NSMutableDictionary()
                if strM2 != nil  && strY2 != nil && strD2 != nil
                {
                    
                    dic .setObject(txtTitle2.text!, forKey: "evTitle" as NSCopying);
                    dic .setObject(strM2, forKey: "evMonth" as NSCopying);
                    dic .setObject(strY2, forKey: "evYear" as NSCopying);
                    dic .setObject(strD2, forKey: "evDate" as NSCopying);
                }
                arrMyEvents .add(dic)
                
            }
            else
            {
                let alert = UIAlertView()
                if strTxtTitle2.characters.count <= 0
                {
                    alert.message = "Please select title"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strM2 == nil
                {
                    alert.message = "Please select month"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strY2 == nil
                {
                    alert.message = "Please select year"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strD2 == nil
                {
                    alert.message = "Please select date"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
            }
        }
        

        
        strTxtTitle3 = txtTitle3.text!
        
        if (strM3 != nil  && strY3 != nil && strD3 != nil)
        {
            if (strM3 != nil  && strY3 != nil && strD3 != nil && strTxtTitle3 != nil && strTxtTitle3.characters.count > 0)
            {
                let dic = NSMutableDictionary()
                if strM3 != nil  && strY3 != nil && strD3 != nil
                {
                    dic .setObject(txtTitle3.text!, forKey: "evTitle" as NSCopying);
                    dic .setObject(strM3, forKey: "evMonth" as NSCopying);
                    dic .setObject(strY3, forKey: "evYear" as NSCopying);
                    dic .setObject(strD3, forKey: "evDate" as NSCopying);
                }
                arrMyEvents .add(dic)
                
            }
            else
            {
                let alert = UIAlertView()
                if strTxtTitle3.characters.count <= 0
                {
                    alert.message = "Please select title"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strM3 == nil
                {
                    alert.message = "Please select month"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strY3 == nil
                {
                    alert.message = "Please select year"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
                else if strD3 == nil
                {
                    alert.message = "Please select date"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    return
                }
            }
        }

        
        
        
        
        
//        ////// First view
//
//        if txtMonth1.text == ""
//        {
//            let alert = UIAlertView()
//            //            alert.title = ""
//            alert.message = "Please select month"
//            alert.addButton(withTitle: "OK")
//            alert.show()
//
//            return;
//
//        }
//        else if txtYear2.text == ""
//        {
//            let alert = UIAlertView()
//            alert.message = "Please select Year"
//            alert.addButton(withTitle: "OK")
//            alert.show()
//            return;
//
//        }
//        else if txtDate3.text == ""
//        {
//            let alert = UIAlertView()
//            alert.message = "Please select Date"
//            alert.addButton(withTitle: "OK")
//            alert.show()
//            return;
//        }
        
        dataSyna()
     
    }
    
    
    func dataSyna()
    {
        if arrMyEvents.count <= 0
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
        
        
        for i in 0..<arrMyEvents.count
        {
            let dateComponents = NSDateComponents()
           
            let dicc = arrMyEvents[i] as! [String : Any]
             let myLocalDic = NSMutableDictionary()
            
                
            var strdddd = (String (describing: dicc["evDate"]!))
            
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
            

            
//            dateComponents.day = Int(String (describing: dicc["evDate"]!))!
           
            dateComponents.month = Int(String (describing: dicc["evMonth"]!))!
            dateComponents.year = Int(String (describing: dicc["evYear"]!))!
            
            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
                let date = gregorianCalendar.date(from: dateComponents as DateComponents)
            {
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
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let dateStart = dateFormatter.string(from:date as Date)
                let dateEnd = dateFormatter.string(from:date.addingTimeInterval(60*60*24) as Date)
                
//                myLocalDic .setObject(event.notes, forKey: "eventType" as NSCopying);
                myLocalDic .setObject(event.title, forKey: "eventTitle" as NSCopying);
                myLocalDic .setObject(dateStart, forKey: "eventSDate" as NSCopying);
                myLocalDic .setObject(dateEnd, forKey: "eventEDate" as NSCopying);
                
//                self.dismiss(animated: true, completion: nil)
            }
            arrCustomList .add(myLocalDic)
            
        }
        
//        var arrList = NSArray()
//
//        arrCustomList.removeAllObjects();
//
//        if UserDefaults.standard.object(forKey: "CustomLst") != nil
//        {
//            let userdefaults = UserDefaults.standard
//            arrList = userdefaults.array(forKey: "CustomLst")! as NSArray
//
//            if (arrList.count > 0)
//            {
//
//                var mutableDictionary = [String: AnyObject]()
//
//                for i in 0..<arrList.count
//                {
//                    mutableDictionary = arrList[i] as! [String : AnyObject]
//                    arrCustomList .add(mutableDictionary)
//                }
//                //                         arrCustomList .add(mutableDictionary)
//            }
//
//            //                    arrCustomList = arrList as! NSMutableArray
////            arrCustomList .add(myLocalDic)
////            UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
//            for i in 0..<arrMyEvents.count
//            {
//                let mutableDictionary = arrMyEvents[i] as! [String : AnyObject]
//                arrCustomList .add(mutableDictionary)
//            }
//
//        } else
//        {
////            for i in 0..<arrMyEvents.count
////            {
////               var mutableDictionary = arrMyEvents[i] as! [String : AnyObject]
////                arrCustomList .add(mutableDictionary)
////            }
////
//////            arrCustomList .add(myLocalDic)
////            UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
//
//        }
        
//        let alert = UIAlertView()
//        alert.message = "events added Successfully "//
//        alert.addButton(withTitle: "OK")//
//        alert.delegate = self
//        alert.show()//                                return
        self.view.makeToast("events added Successfully")
        
        UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
        
        txtTitle1.text = ""
        txtDate1.text = ""
        txtMonth1.text = ""
        txtYear1.text = ""
        btnBeforeSunset1.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset1.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        isAfterSunSet1 = false
        txtTitle1.textFieldDidChange()
        txtDate1.textFieldDidChange()
        txtMonth1.textFieldDidChange()
        txtYear1.textFieldDidChange()
        
        
        txtTitle2.text = ""
        txtDate2.text = ""
        txtMonth2.text = ""
        txtYear2.text = ""
        btnBeforeSunset2.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset2.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        isAfterSunSet2 = false
        txtTitle2.textFieldDidChange()
        txtDate2.textFieldDidChange()
        txtMonth2.textFieldDidChange()
        txtYear2.textFieldDidChange()
        
        
        txtTitle3.text = ""
        txtDate3.text = ""
        txtMonth3.text = ""
        txtYear3.text = ""
        btnBeforeSunset3.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        btnAfterSunset3.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        isAfterSunSet3 = false
        txtTitle3.textFieldDidChange()
        txtDate3.textFieldDidChange()
        txtMonth3.textFieldDidChange()
        txtYear3.textFieldDidChange()
   
        strD1 = ""
        strY1 = ""
        strM1 = ""
        
        strD2 = ""
        strY2 = ""
        strM2 = ""
        
        strD3 = ""
        strY3 = ""
        strM3 = ""
        
        UserDefaults.standard.set("", forKey: "Conv_Date")
        UserDefaults.standard.set("", forKey: "Conv_Month")
        UserDefaults.standard.set("", forKey: "Conv_Year")
        UserDefaults.standard.set("", forKey: "Conv_SunSet")
        
       self .dismiss(animated: true, completion: nil)
        
    }
    
    
     func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
           self .dismiss(animated: true, completion: nil)
    }
    
    
    
    
//
//    func actionSyncData()
//    {
//        //         checkDataStore()
//
//
//
//        var strGetEventTitle = String()
//        var strGetEventDate = Date()
//
//        let dateComponents = NSDateComponents()
//
//        dateComponents.day = Int(arrMyEvents )!
//        dateComponents.month = Int(strM)!
//        dateComponents.year = Int(strY)!
//
//
//        if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
//            let mmdate = gregorianCalendar.date(from: dateComponents as DateComponents)
//        {
//
//            let predicate = eventStore.predicateForEvents(withStart: mmdate, end: mmdate.addingTimeInterval(60*60*24), calendars: calendars)
//
//            let events = eventStore.events(matching: predicate) as [EKEvent]
//
//            print("Events: \(events)")
//            for event in events
//            {
//                strGetEventTitle = event.title;
//                strGetEventDate = event.startDate;
//            }
//
//            if strGetEventTitle == txtTitle.text && strGetEventDate == mmdate
//            {
//
//            }
//            else
//            {   let myLocalDic = NSMutableDictionary()
//
////                if isCheck == true
////                {
//
//                    for i in 0..<arrMyEvents.count
//                    {
//                        let dateComponents = NSDateComponents()
//
//                        dateComponents.day = Int(strD)!
//                        dateComponents.month = Int(strM)!
//                        dateComponents.year = Int(strY)! + i
//
//                        if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
//                            let date = gregorianCalendar.date(from: dateComponents as DateComponents)
//                        {
//                            let weekday = gregorianCalendar.component(.year, from: date)
//                            print(weekday)
//
//                            let event:EKEvent = EKEvent(eventStore: eventStore)
//                            event.title = txtTitle.text!
//                            event.startDate = date
//                            event.endDate = date.addingTimeInterval(60*60*1)
//                            event.notes = ""
//                            event.calendar = eventStore.defaultCalendarForNewEvents
//                            do
//                            {
//                                try eventStore.save(event, span: .thisEvent)
//                                print("events added with dates:")
//                            }
//                            catch let e as NSError
//                            {
//                                print(e.description)
//                                return
//                            }
//                            self.dismiss(animated: true, completion: nil)
//                        }
//                    }
//
////                    let dateFormatter = DateFormatter()
////                    dateFormatter.dateFormat = "MM/dd/yyyy"
////                    let dateStart = dateFormatter.string(from:mmdate as Date)
////                    let dateEnd = dateFormatter.string(from:mmdate.addingTimeInterval(60*60*1) as Date)
////
////
////                    myLocalDic .setObject(txtTitle.text, forKey: "Title" as NSCopying);
////                    myLocalDic .setObject(dateStart, forKey: "Startdate" as NSCopying);
////                    myLocalDic .setObject(dateEnd, forKey: "EndDate" as NSCopying);
//
//
////                }
////                else
////                {
////                    let dateComponents = NSDateComponents()
////
////                    dateComponents.day = Int(strD)!
////                    dateComponents.month = Int(strM)!
////                    dateComponents.year = Int(strY)!
////
////                    if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
////                        let date = gregorianCalendar.date(from: dateComponents as DateComponents)
////                    {
////
////                        let event:EKEvent = EKEvent(eventStore: eventStore)
////                        event.title = txtTitle.text!
////                        //                         event.title = ""
////                        event.startDate = date
////                        event.endDate = date.addingTimeInterval(60*60*1)
////                        event.notes = ""
////                        event.calendar = eventStore.defaultCalendarForNewEvents
////                        do
////                        {
////                            try eventStore.save(event, span: .thisEvent)
////                            print("events added with dates:")
////                        }
////                        catch let e as NSError
////                        {
////                            print(e.description)
////                            return
////                        }
////                        self.dismiss(animated: true, completion: nil)
////                    }
////
////
////                    let dateFormatter = DateFormatter()
////                    dateFormatter.dateFormat = "MM/dd/yyyy"
////                    let dateStart = dateFormatter.string(from:mmdate as Date)
////                    let dateEnd = dateFormatter.string(from:mmdate.addingTimeInterval(60*60*1) as Date)
////
////
////                    myLocalDic .setObject(txtTitle.text, forKey: "Title" as NSCopying);
////                    myLocalDic .setObject(dateStart, forKey: "Startdate" as NSCopying);
////                    myLocalDic .setObject(dateEnd, forKey: "EndDate" as NSCopying);
////
////                }
//
////                var arrList = NSArray()
////
////                arrCustomList.removeAllObjects();
////
////                if UserDefaults.standard.object(forKey: "CustomLst") != nil
////                {
////                    let userdefaults = UserDefaults.standard
////                    arrList = userdefaults.array(forKey: "CustomLst")! as NSArray
////
////                    if (arrList.count > 0)
////                    {
////                        //                        var dic = NSMutableDictionar()
////                        //
////                        //                        for i in 0..<arrList.count
////                        //                        {
////                        //                            dic =
////                        //                        }
////                        var mutableDictionary = [String: AnyObject]()
////
////                        for i in 0..<arrList.count
////                        {
////                            mutableDictionary = arrList[i] as! [String : AnyObject]
////                            arrCustomList .add(mutableDictionary)
////                        }
////                        //                         arrCustomList .add(mutableDictionary)
////                    }
////
////                    //                    arrCustomList = arrList as! NSMutableArray
////                    arrCustomList .add(myLocalDic)
////                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
////
////                } else
////                {
////                    arrCustomList .add(myLocalDic)
////                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
////
////                }
//
//
////                txtTitle.text = ""
////                txtDate.text = ""
////                strPickerDate = ""
////                txtMonth.text = ""
////                txtYear.text = ""
////                btnCheckBox.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
////                btnAutoSync.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
////                iAutoSync = false
////                isCheck = false
////
////                txtTitle.textFieldDidChange()
////                txtDate.textFieldDidChange()
////                txtMonth.textFieldDidChange()
////                txtYear.textFieldDidChange()
//            }
//        }
//
//        //        uploadSampleData()
//    }

    
    
}



class dateCustonCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
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




