//
//  DateConverterVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/23/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import EventKit
import EventKitUI
import CoreData

//import SkyFloatingLabelTextField

class DateConverterVC: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource
//class DateConverterVC: UIViewController
{
//    var coreData = CoreDataStack1()
    
    @IBOutlet weak var CustomHeaderImage: UIImageView!
    
    //    @IBOutlet weak var txtDate: kTextFiledPlaceHolder!
    
    @IBOutlet weak var btnCheckBox: UIButton!
    
    var isCheck = false
    var iAutoSync = false
    
    var isAfterSunSet = false
    
    var event: EKEvent!
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    var eventDetailsArray = [AnyHashable]()
    var strPickerDate = NSString()
    
    var arrCustomList = NSMutableArray()
    
    @IBOutlet weak var btnAdd: UIButton!
    
    
    @IBOutlet weak var FirstView: UIView!
    @IBOutlet weak var txtTitle: kTextFiledPlaceHolder!
    @IBOutlet var txtMonth: kTextFiledPlaceHolder!
    @IBOutlet var txtYear: kTextFiledPlaceHolder!
    @IBOutlet var txtDate: kTextFiledPlaceHolder!
    @IBOutlet var txtLanguage: kTextFiledPlaceHolder!
    @IBOutlet var txtTemparay: kTextFiledPlaceHolder!
    
    @IBOutlet weak var btnCheck: UIButton!
    
    @IBOutlet weak var SecondView: UIView!
    
   @IBOutlet weak var btnSelLangauage: UIButton!
    
    
    @IBOutlet weak var arrow_month: UIImageView!
    @IBOutlet weak var arrow_Year: UIImageView!
    @IBOutlet weak var arrow_Day: UIImageView!
    
    
    @IBOutlet weak var lblSDay: UILabel!
    @IBOutlet weak var lblSMonth: UILabel!
    @IBOutlet weak var lblSYear: UILabel!
    @IBOutlet weak var lblSDayValue: UILabel!
    @IBOutlet weak var lblSMonthValue: UILabel!
    @IBOutlet weak var lblSYearValue: UILabel!
    
    @IBOutlet weak var tblMonth: UITableView!
    @IBOutlet weak var tblYear: UITableView!
    @IBOutlet weak var tblDate: UITableView!
    //    @IBOutlet weak var tblLanguage: UITableView!
    
    @IBOutlet weak var MonthBGView: UIView!
    @IBOutlet weak var YearBGView: UIView!
    @IBOutlet weak var DateBGView: UIView!
    //    @IBOutlet weak var LanguageBGView: UIView!
    
    @IBOutlet weak var ThirdView: UIView!
    @IBOutlet weak var btnAutoSync: UIButton!
    
    
    
    
    
    @IBOutlet weak var lblDayCons_Height1: NSLayoutConstraint!
    
    @IBOutlet weak var lblMonthCons_Height1: NSLayoutConstraint!
    
    @IBOutlet weak var lblYearCons_height1: NSLayoutConstraint!
    
    @IBOutlet weak var lblMonthVAlue_height1: NSLayoutConstraint!
    
    @IBOutlet weak var lblYearValueCons_Heigt1: NSLayoutConstraint!
    
    @IBOutlet weak var sec_Day_TopCons: NSLayoutConstraint!
    
    @IBOutlet weak var sec_SelectYearList_BottomCons1: NSLayoutConstraint!
    
    @IBOutlet weak var SecondViewBottomCons1: NSLayoutConstraint!
    
    @IBOutlet weak var secondViewLeadingCon1: NSLayoutConstraint!
    
    @IBOutlet weak var secondViewTrailingCon1: NSLayoutConstraint!
    
//    @IBOutlet weak var btnSwitch: UISwitch!
    
    @IBOutlet weak var BtnConvertDate: UIButton!
    
    @IBOutlet weak var viewMIddleCons_Height1: NSLayoutConstraint!
    
    
    @IBOutlet weak var btnConvert_Top_cons: NSLayoutConstraint!
    
    @IBOutlet weak var btnConvert_Height_cons: NSLayoutConstraint!
    
    @IBOutlet weak var thirdviewBotton_Cons: NSLayoutConstraint!
    
    @IBOutlet  weak var BtnBeforeSunSet: UIButton!
    @IBOutlet  weak var BtnAfterSunSet: UIButton!
    
    
    var arrMonth: NSArray!
    var arrYear: NSArray!
    
    
    
    var strL = String()
    
    var arrMonthGregion = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    var arrMonthHebrew = ["Nisan", "Iyyar", "Sivan", "Tamuz", "Av", "Elul", "Tishrei", "Cheshvan", "Kislev", "Tevet", "Sh'vat", "Adar"]
    
    var arrYearGregion = ["1920","1921","1922","1923","1924","1925","1926","1927","1928","1929","1930","1931","1932","1933","1934","1935","1936","1937","1938","1939","1940","1941","1942","1943","1944","1945","1946","1947","1948","1949","1950","1951","1952","1953","1954","1955","1956","1957","1958","1959","1960","1961","1962","1963","1964","1965","1966","1967","1968","1969","1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050"]
    
    var arrYearHebrew = ["5685","5686","5687","5688","5689","5690","5691","5692","5693","5694","5695","5696","5697","5698","5699","5700","5701","5702","5703","5704","5705","5706","5707","5708","5709","5710","5711","5712","5713","5714","5715","5716","5717","5718","5719","5720","5721","5722","5723","5724","5725","5726","5727","5728","5729","5730","5731","5732","5733","5734","5735","5736","5737","5738","5739","5740","5741","5742","5743","5744","5745","5746","5747","5748","5749","5750","5751","5752","5753","5754","5755","5756","5757","5758","5759","5760","5761","5762","5763","5764","5765","5766","5767","5768","5769","5770","5771","5772","5773","5774","5775","5776","5777","5778","5779","5780","5781","5782","5783","5784","5785","5786","5787","5788","5789","5790","5791","5792","5793","5794","5795","5796","5797","5798","5799","5800","5801","5802","5803","5804","5805","5806","5807","5808","5809","5810","5811"]

    
    var arrDate = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31",]
    var arrLanguage = ["Hebrew"]
    
    let tap1 = UITapGestureRecognizer()
//    var isCheckSunSet = false
    
    var strM: String!
    var strD: String!
    var strY: String!
    
    var buttonMonth: UIButton!
    var buttonYear: UIButton!
    var buttonDate: UIButton!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        btnSelLangauage.tag = 401;
        btnSelLangauage.setImage(UIImage(named: "Dir_Right"), for: UIControlState.normal)

        btnAdd?.layer.cornerRadius = 5;
        btnAdd?.layer.borderColor = UIColor.black.cgColor;
        btnAdd?.layer.borderWidth = 1;
        btnAdd?.layer.masksToBounds = true;
        
        
//        btnSwitch .setOn(false, animated: true)
        strL = "Hebrew"
        arrMonth = arrMonthGregion as NSArray
        arrYear = arrYearGregion as NSArray

        tblMonth.tag = 321;
        tblYear.tag = 322;
        tblDate.tag = 323;

//        isCheckSunSet = false;

        txtMonth.directionMaterial = placeholderDirection.placeholderUp
        txtYear.directionMaterial = placeholderDirection.placeholderUp
        txtDate.directionMaterial = placeholderDirection.placeholderUp
        txtLanguage.directionMaterial = placeholderDirection.placeholderUp

//        txtTitle.delegate = self;
        txtMonth.delegate = self;
        txtYear.delegate = self;
        txtDate.delegate = self;

        tblMonth.delegate = self;
        tblYear.delegate = self;
        tblDate.delegate = self;


        MonthBGView.isHidden = true
        YearBGView.isHidden = true
        DateBGView.isHidden = true


        BtnConvertDate?.layer.cornerRadius = (BtnConvertDate?.frame.size.height)!/2;
        BtnConvertDate?.layer.borderColor = UIColor.white.cgColor;
        BtnConvertDate?.layer.borderWidth = 1;
        BtnConvertDate?.layer.masksToBounds = true;

//        btnSwitch?.layer.cornerRadius = (btnSwitch?.frame.size.height)!/2;
//        btnSwitch?.layer.borderColor = UIColor.white.cgColor;
//        btnSwitch?.layer.borderWidth = 1;
//        btnSwitch?.layer.masksToBounds = true;

        // Do any additional setup after loading the view.
        
        
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
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.lblSDayValue?.text = "00"
        self.lblSMonthValue?.text = "Select month from list"
        self.lblSYearValue?.text = "Select Year from list"
        
        BtnBeforeSunSet.tag = 901
        BtnBeforeSunSet.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        BtnAfterSunSet.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
//        let settingViewController: AddCustomEvent = mainStoryboard.instantiateViewController(withIdentifier: "AddCustomEvent") as! AddCustomEvent
//
//        self .present(settingViewController, animated: true, completion: nil)
        if txtMonth.text == nil || txtDate.text == nil
        {
            UserDefaults.standard.set("", forKey: "Conv_Date")
            UserDefaults.standard.set("", forKey: "Conv_Month")
            UserDefaults.standard.set("", forKey: "Conv_Year")
            UserDefaults.standard.set("", forKey: "Conv_SunSet")
        }
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        let settingViewController: NewAddCustomEventsVC = mainStoryboard.instantiateViewController(withIdentifier: "NewAddCustomEventsVC") as! NewAddCustomEventsVC
        
        self .present(settingViewController, animated: true, completion: nil)
        
    }
    
    
    
    //    override func viewWillAppear(_ animated: Bool)
    override func viewDidLayoutSubviews()
    {
//        super.viewWillAppear(true)

        myLayout()
//      let tap1 = UITapGestureRecognizer(target: self, action: "onSingleTap")

        buttonMonth = UIButton(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y, width: txtMonth.frame.size.width, height: txtMonth.frame.size.height))
        buttonMonth.addTarget(self, action: #selector(buttonActionMonth), for: .touchUpInside)
        self.FirstView.addSubview(buttonMonth)
        buttonMonth.tag = 701
        
        buttonYear = UIButton(frame: CGRect(x: txtYear.frame.origin.x, y: txtYear.frame.origin.y, width:
            txtYear.frame.size.width, height: txtYear.frame.size.height))
        buttonYear.addTarget(self, action: #selector(buttonActionYear), for: .touchUpInside)
        self.FirstView.addSubview(buttonYear)
        buttonYear.tag = 801

        buttonDate = UIButton(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y, width: txtDate.frame.size.width, height: txtDate.frame.size.height))
        buttonDate.addTarget(self, action: #selector(buttonActionDate), for: .touchUpInside)
        self.FirstView.addSubview(buttonDate)
        buttonDate.tag = 901

//        txtTitle.directionMaterial = placeholderDirection.placeholderUp
        txtMonth.directionMaterial = placeholderDirection.placeholderUp
        txtYear.directionMaterial = placeholderDirection.placeholderUp
        txtDate.directionMaterial = placeholderDirection.placeholderUp
        txtLanguage.directionMaterial = placeholderDirection.placeholderUp

        let bottomMonthLine = UIView(frame: CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y + txtMonth.frame.size.height - 1, width: txtMonth.frame.size.width, height: 1))
        bottomMonthLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.FirstView.addSubview(bottomMonthLine)

        let bottomYearLine = UIView(frame: CGRect(x: txtYear.frame.origin.x, y: txtYear.frame.origin.y + txtYear.frame.size.height - 1, width: txtYear.frame.size.width, height: 1))
        bottomYearLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.FirstView.addSubview(bottomYearLine)

        let bottomDateLine = UIView(frame: CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y + txtYear.frame.size.height - 1, width: txtDate.frame.size.width, height: 1))
        bottomDateLine.backgroundColor = UIColor(red: 210.0 / 255.0, green: 210.0 / 255.0, blue: 210.0 / 255.0, alpha: 0.87)
        self.FirstView.addSubview(bottomDateLine)

        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }

    func myBackGraound(strmonth: NSInteger)
    {
        let strimagename = "commanHeader" + "\(strmonth)"
        CustomHeaderImage.image = UIImage(named: strimagename)

    }

    
    func buttonActionMonth()
    {
        
        if buttonMonth.tag == 701
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = false
            YearBGView.isHidden = true
            DateBGView.isHidden = true
            tblMonth.reloadData()
            arrow_month.image = UIImage(named: "UP_arrow")
            arrow_Year.image = UIImage(named: "Down_arrow")
            arrow_Day.image = UIImage(named: "Down_arrow")
            
            buttonMonth.tag = 702
            buttonYear.tag = 801
            buttonDate.tag = 901
        }
        else
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = true
            YearBGView.isHidden = true
            DateBGView.isHidden = true
            tblMonth.reloadData()
            arrow_month.image = UIImage(named: "Down_arrow")
            arrow_Year.image = UIImage(named: "Down_arrow")
            arrow_Day.image = UIImage(named: "Down_arrow")

            buttonMonth.tag = 701
            buttonYear.tag = 801
            buttonDate.tag = 901
        }

    }

    func buttonActionYear()
    {
        if  buttonYear.tag == 801
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = true
            YearBGView.isHidden = false
            DateBGView.isHidden = true
            tblYear.reloadData()
            
            arrow_month.image = UIImage(named: "Down_arrow")
            arrow_Year.image = UIImage(named: "UP_arrow")
            arrow_Day.image = UIImage(named: "Down_arrow")
            
            buttonMonth.tag = 701
            buttonYear.tag = 802
            buttonDate.tag = 901
            

        }
        else
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = true
            YearBGView.isHidden = true
            DateBGView.isHidden = true
            tblYear.reloadData()
            arrow_month.image = UIImage(named: "Down_arrow")
            arrow_Year.image = UIImage(named: "Down_arrow")
            arrow_Day.image = UIImage(named: "Down_arrow")
            
            buttonMonth.tag = 701
            buttonYear.tag = 801
            buttonDate.tag = 901
            

            
        }
        


    }

    func buttonActionDate()
    {
        if buttonDate.tag == 901
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = true
            YearBGView.isHidden = true
            DateBGView.isHidden = false
            tblDate.reloadData()
            arrow_month.image = UIImage(named: "Down_arrow")
            arrow_Year.image = UIImage(named: "Down_arrow")
            arrow_Day.image = UIImage(named: "UP_arrow")
            
            buttonMonth.tag = 701
            buttonYear.tag = 801
            buttonDate.tag = 902
        }
        else
        {
            self.view .endEditing(true)
            MonthBGView.isHidden = true
            YearBGView.isHidden = true
            DateBGView.isHidden = true
            tblDate.reloadData()
            arrow_month.image = UIImage(named: "Down_arrow")
            arrow_Year.image = UIImage(named: "Down_arrow")
            arrow_Day.image = UIImage(named: "Down_arrow")
            
            buttonMonth.tag = 701
            buttonYear.tag = 801
            buttonDate.tag = 901
        }

    }


    func myLayout()
    {
        if IS_IPAD_PRO
        {
            lblSDay?.font = UIFont(name: "Roboto-Light", size: 40)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 40)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 40)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 240)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 55)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 55)

            lblDayCons_Height1.constant = 50
            lblMonthCons_Height1.constant = 50
            lblYearCons_height1.constant = 50
            lblMonthVAlue_height1.constant = 140
            lblYearValueCons_Heigt1.constant = 140

            viewMIddleCons_Height1.constant = 225
            

            secondViewLeadingCon1.constant = self.view.frame.size.width * 0.12
            secondViewTrailingCon1.constant = self.view.frame.size.width * 0.12
//            SecondViewBottomCons1.constant = self.view.frame.size.width * 0.10

            sec_Day_TopCons.constant = 45
//            sec_SelectYearList_BottomCons1.constant = 55
            thirdviewBotton_Cons.constant = 40;
            btnConvert_Top_cons.constant  = 25
            btnConvert_Height_cons.constant  = 45

            //            btnConvertDate_HConst1.constant = 35;

        }
        else if IS_IPAD
        {


            lblSDay?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 220)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 50)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 50)

            lblDayCons_Height1.constant = 45
            lblMonthCons_Height1.constant = 45
            lblYearCons_height1.constant = 45
            lblMonthVAlue_height1.constant = 70;
            lblYearValueCons_Heigt1.constant = 70
            viewMIddleCons_Height1.constant = 275;

            secondViewLeadingCon1.constant = self.view.frame.size.width * 0.12
            secondViewTrailingCon1.constant = self.view.frame.size.width * 0.12
//            SecondViewBottomCons1.constant = self.view.frame.size.width * 0.05
            sec_Day_TopCons.constant = 40
//            sec_SelectYearList_BottomCons1.constant = 50
            thirdviewBotton_Cons.constant = 25
            btnConvert_Top_cons.constant  = 25
            btnConvert_Height_cons.constant  = 45

            //            btnConvertDate_HConst.constant = 35
        }
        else if IS_IPHONE_5 || IS_IPHONE_4_OR_LESS
        {

            lblSDay?.font = UIFont(name: "Roboto-Light", size: 15)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 15)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 15)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 50)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 20)

            lblDayCons_Height1.constant = 25
            lblMonthCons_Height1.constant = 25
            lblYearCons_height1.constant = 25
            lblMonthVAlue_height1.constant = 35;
            lblYearValueCons_Heigt1.constant = 35
            viewMIddleCons_Height1.constant = 170;

            sec_Day_TopCons.constant = 10
//            sec_SelectYearList_BottomCons1.constant = 25

        }
        else if IS_IPHONE_6_7
        {

            lblSDay?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 65)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 25)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 25)

            lblDayCons_Height1.constant = 30
            lblMonthCons_Height1.constant = 30
            lblYearCons_height1.constant = 30
            lblMonthVAlue_height1.constant = 40;
            lblYearValueCons_Heigt1.constant = 40
            viewMIddleCons_Height1.constant = 170;

            sec_Day_TopCons.constant = 8
//            sec_SelectYearList_BottomCons1.constant = 30
        }
        else if IS_IPHONE_X
        {
            
            lblSDay?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 20)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 120)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 25)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 25)
            
            lblDayCons_Height1.constant = 30
            lblMonthCons_Height1.constant = 30
            lblYearCons_height1.constant = 30
            lblMonthVAlue_height1.constant = 40;
            lblYearValueCons_Heigt1.constant = 40
            viewMIddleCons_Height1.constant = 175;
            
            sec_Day_TopCons.constant = 15
            //            sec_SelectYearList_BottomCons1.constant = 30
        }
        else if IS_IPHONE_6P_7P
        {

            lblSDay?.font = UIFont(name: "Roboto-Light", size: 23)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 23)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 23)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 100)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 28)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 28)

            lblDayCons_Height1.constant = 35
            lblMonthCons_Height1.constant = 35
            lblYearCons_height1.constant = 35
            lblMonthVAlue_height1.constant = 45;
            lblYearValueCons_Heigt1.constant = 45
            viewMIddleCons_Height1.constant = 180;

            sec_Day_TopCons.constant = 10
//            sec_SelectYearList_BottomCons1.constant = 30

        }
        else
        {
            lblSDay?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSYear?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSMonth?.font = UIFont(name: "Roboto-Light", size: 35)
            lblSDayValue?.font = UIFont(name: "Roboto-Light", size: 220)
            lblSMonthValue?.font = UIFont(name: "Roboto-Light", size: 50)
            lblSYearValue?.font = UIFont(name: "Roboto-Light", size: 50)

            lblDayCons_Height1.constant = 45
            lblMonthCons_Height1.constant = 45
            lblYearCons_height1.constant = 45
            lblMonthVAlue_height1.constant = 70;
            lblYearValueCons_Heigt1.constant = 70
            viewMIddleCons_Height1.constant = 250;

            secondViewLeadingCon1.constant = self.view.frame.size.width * 0.12
            secondViewTrailingCon1.constant = self.view.frame.size.width * 0.12
//            SecondViewBottomCons1.constant = self.view.frame.size.width * 0.10
            sec_Day_TopCons.constant = 40
//            sec_SelectYearList_BottomCons1.constant = 50
        }

       
//        if IS_IPHONE_4_OR_LESS || IS_IPHONE_5 || IS_IPHONE_6_7 || IS_IPHONE_6P_7P
     if IS_IPAD || IS_IPAD_PRO
        {
            MonthBGView.frame = CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y+txtMonth.frame.size.height, width: txtMonth.frame.size.width, height: CGFloat(44 * 10))
            
            YearBGView.frame = CGRect(x: txtYear.frame.origin.x, y: txtYear.frame.origin.y+txtYear.frame.size.height, width: txtYear.frame.size.width, height: CGFloat(44 * 10))
            
            DateBGView.frame = CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y+txtDate.frame.size.height, width: txtDate.frame.size.width, height: CGFloat(44 * 10))
        }
        else
        {
            MonthBGView.frame = CGRect(x: txtMonth.frame.origin.x, y: txtMonth.frame.origin.y+txtMonth.frame.size.height, width: txtMonth.frame.size.width, height: CGFloat(44 * 6))
            
            YearBGView.frame = CGRect(x: txtYear.frame.origin.x, y: txtYear.frame.origin.y+txtYear.frame.size.height, width: txtYear.frame.size.width, height: CGFloat(44 * 6))
            
            DateBGView.frame = CGRect(x: txtDate.frame.origin.x, y: txtDate.frame.origin.y+txtDate.frame.size.height, width: txtDate.frame.size.width, height: CGFloat(44 * 6))
        }
        
        tblMonth.frame = CGRect(x: 0, y: 0, width: MonthBGView.frame.size.width, height: MonthBGView.frame.size.height)
        tblYear.frame = CGRect(x: 0, y: 0, width: YearBGView.frame.size.width, height: YearBGView.frame.size.height)
        tblDate.frame = CGRect(x: 0, y: 0, width: DateBGView.frame.size.width, height: DateBGView.frame.size.height)
       

        let layer1 = MonthBGView.layer
        layer1.shadowColor = UIColor.black.cgColor
        layer1.shadowOffset = CGSize(width: 0, height: 10)
        layer1.shadowOpacity = 0.8
        layer1.shadowRadius = 7

        let layer2 = YearBGView.layer
        layer2.shadowColor = UIColor.black.cgColor
        layer2.shadowOffset = CGSize(width: 0, height: 10)
        layer2.shadowOpacity = 0.8
        layer2.shadowRadius = 7

        let layer3 = DateBGView.layer
        layer3.shadowColor = UIColor.black.cgColor
        layer3.shadowOffset = CGSize(width: 0, height: 10)
        layer3.shadowOpacity = 0.8
        layer3.shadowRadius = 7

        
    }

    @IBAction func btnSunSet(_ sender: UIButton)
    {
        if sender.tag == 902
        {
            isAfterSunSet = true;
            BtnAfterSunSet.tag = 902
            BtnBeforeSunSet.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
            BtnAfterSunSet.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
        }
        else
        {
            isAfterSunSet = false;
            BtnBeforeSunSet.tag = 901
            BtnBeforeSunSet.setImage(UIImage(named: "Sunset_selected"), for: UIControlState.normal)
            BtnAfterSunSet.setImage(UIImage(named: "Sunset_Unselected"), for: UIControlState.normal)
        }
    }


    @IBAction func btnActionAutoSync(_ sender: UIButton)
    {
//        if iAutoSync==false
//        {
//            iAutoSync = true
//            btnAutoSync.setBackgroundImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
//        }
//        else
//        {
//            iAutoSync = false
//            btnAutoSync.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
//        }
    }
    
    @IBAction func btnSelLanguage(_ sender: UIButton)
    {
        if btnSelLangauage.tag == 401
        {
             if strL == "Hebrew"
             {
                strM = ""
                strY = ""
                strD = ""
 //               txtTitle.text = ""
                txtDate.text = ""
                strPickerDate = ""
                txtMonth.text = ""
                txtYear.text = ""
 //               txtTitle.textFieldDidChange()
                txtDate.textFieldDidChange()
                txtMonth.textFieldDidChange()
                txtYear.textFieldDidChange()
            }
            
            
            arrYear = arrYearHebrew as NSArray
            arrMonth = arrMonthHebrew as NSArray
            strL = "English"
            btnSelLangauage.tag = 402
            btnSelLangauage.setImage(UIImage(named: "Dir_Left"), for: UIControlState.normal)
        }
        else
        {
            if strL == "English"
            {
                strM = ""
                strY = ""
                strD = ""
//                txtTitle.text = ""
                txtDate.text = ""
                strPickerDate = ""
                txtMonth.text = ""
                txtYear.text = ""
//                txtTitle.textFieldDidChange()
                txtDate.textFieldDidChange()
                txtMonth.textFieldDidChange()
                txtYear.textFieldDidChange()
            }
            strL = "Hebrew"
            arrYear = arrYearGregion as NSArray
            arrMonth = arrMonthGregion as NSArray
            btnSelLangauage.tag = 401
            btnSelLangauage.setImage(UIImage(named: "Dir_Right"), for: UIControlState.normal)
        }
        
        
    }
    

    @IBAction func btnConvertDate(_ sender: UIButton)
    {
        self.view .endEditing(true)
        loaddata()
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 321
        {
            return arrMonth.count;
        }
        else if tableView.tag == 322
        {
            return arrYear.count
        }
        else if tableView.tag == 323
        {
            return arrDate.count
        }
        else
        {
            return arrLanguage.count
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "dateCustonCell"
        let cell: dateCustonCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? dateCustonCell
        
        if tableView.tag == 321
        {
            cell.lblTitle.text = arrMonth[indexPath.row] as? String;
        }
        else if tableView.tag == 322
        {
            cell.lblTitle.text = arrYear[indexPath.row] as? String;
        }
        else if tableView.tag == 323
        {
            cell.lblTitle.text = arrDate[indexPath.row];
        }
        else if tableView.tag == 324
        {
            cell.lblTitle.text = arrLanguage[indexPath.row];
        }
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.tag == 321
        {
            txtMonth.text = arrMonth[indexPath.row] as? String;
            MonthBGView.isHidden = true;
            txtMonth.textFieldDidChange()
            if btnSelLangauage.tag == 402 || strL == "English"
            {
                strM = txtMonth.text
            }
            else
            {
                strM = String (describing: indexPath.row + 1)
            }
            arrow_month.image = UIImage(named: "Down_arrow")
            
        }
        else if tableView.tag == 322
        {
            txtYear.text = arrYear[indexPath.row] as? String;
            YearBGView.isHidden = true;
            txtYear.textFieldDidChange()
            strY = txtYear.text
            arrow_Year.image = UIImage(named: "Down_arrow")
            
        }
        else if tableView.tag == 323
        {
            txtDate.text = arrDate[indexPath.row];
            DateBGView.isHidden = true
            txtDate.textFieldDidChange()
            strD = txtDate.text
            arrow_Day.image = UIImage(named: "Down_arrow")
        }

    }

    func addShadow(myView: UIView)
    {
        let shadowPath = UIBezierPath(rect: CGRect(x:0, y: tblMonth.frame.origin.y, width: tblMonth.frame.size.width, height: tblMonth.frame.size.height))
        myView.layer.shadowColor = UIColor.lightGray.cgColor
        myView.layer.shadowOffset = CGSize(width: 0, height: 20)
        myView.layer.shadowOpacity = 0.5
        myView.layer.shadowRadius = 15
        myView.layer.masksToBounds =  false
        myView.layer.shadowPath = shadowPath.cgPath
    }

    func textFieldDidBeginEditing(_ textField: UITextField)  //delegate method
    {
        
        MonthBGView.isHidden = true
        YearBGView.isHidden = true
        DateBGView.isHidden = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }

    func loaddata()
    {
        if txtMonth.text == ""
        {
            let alert = UIAlertView()
            //            alert.title = ""
            alert.message = "Please select month"
            alert.addButton(withTitle: "OK")
            alert.show()

            return;

        }
        else if txtYear.text == ""
        {
            let alert = UIAlertView()
            alert.message = "Please select Year"
            alert.addButton(withTitle: "OK")
            alert.show()
            return;

        }
        else if txtDate.text == ""
        {
            let alert = UIAlertView()
            alert.message = "Please select Date"
            alert.addButton(withTitle: "OK")
            alert.show()
            return;
        }

        if isAfterSunSet == true
        {
            var dd = Int(strD)
            dd = dd! + 1
//            let MonthAfterSunSet = String(describing: dd)
//            txtTemparay.text = dd?.description
            strD = dd?.description
            
//            strTxtTitle1 = txtTitle1.text!
            
            
        }
        
     
        if strL == "English"
        {

            let parameters:  [String:Any]  =
                [
                    "hy": strY,
                    "hm": strM,
                    "hd": strD,
                    "h2g": "1",
                    "cfg":"json",
                ]
            
//            http://www.hebcal.com/converter/?cfg=json&hy=5749&hm=Kislev&hd=25&h2g=1
            
                    Alamofire.request("http://www.hebcal.com/converter/", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
                        switch(response.result)
                        {
                        case .success(_):
                            if response.result.value != nil{
                                print(response.result.value!)
            
                                let dic = response.result.value as! [String : Any]
                                let str  =  String (describing: dic["gd"]!)
                                let str1  = String (describing: dic["gm"]!)
                                let str2  = String (describing: dic["gy"]!)
            
                                self.lblSDayValue?.text = str
                                self.lblSMonthValue?.text = str1
                                self.lblSYearValue?.text = str2
            //                    var arrEvent = dic["events"] as! [String]
            //                    self.lblday?.text = arrEvent[0]//
                                
                                self.strY = str2
                                self.strM = str1
                                
                                UserDefaults.standard.set(self.lblSDayValue.text!, forKey: "Conv_Date")
                                UserDefaults.standard.set(self.lblSMonthValue?.text!, forKey: "Conv_Month")
                                UserDefaults.standard.set(self.lblSYearValue?.text!, forKey: "Conv_Year")
                                UserDefaults.standard.set(self.isAfterSunSet, forKey: "Conv_SunSet")
                                
//                                if self.iAutoSync == true
//                                {
////                                    self.actionSyncData()
//                                }
//                                else
//                                {
 //                                   self.txtTitle.text = ""
                                    self.txtDate.text = ""
                                    self.strPickerDate = ""
                                    self.txtMonth.text = ""
                                    self.txtYear.text = ""
                                    
//                                    self.txtTitle.textFieldDidChange()
                                    self.txtDate.textFieldDidChange()
                                    self.txtMonth.textFieldDidChange()
                                    self.txtYear.textFieldDidChange()
//                                }
                               
            
                            }
                            break
            
                        case .failure(_):
                            print(response.result.error!)
                            break
                        }
                    }
        }
        else
        {
            
            UserDefaults.standard.set(txtDate.text!, forKey: "Conv_Date")
            UserDefaults.standard.set(strM, forKey: "Conv_Month")
            UserDefaults.standard.set(strY, forKey: "Conv_Year")
            UserDefaults.standard.set(self.isAfterSunSet, forKey: "Conv_SunSet")
            
//        http://www.hebcal.com/converter/?cfg=json&gy=2011&gm=6&gd=2&g2h=1
            let parameters:  [String:Any]  =
                [
                    "gy": strY,
                    "gm": strM,
                    "gd": strD,
                    "g2h": "1",
                    "cfg":"json",
                    ]

            Alamofire.request("http://www.hebcal.com/converter/", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in

                switch(response.result)
                {
                case .success(_):
                    if response.result.value != nil
                    {
                        print(response.result.value!)

                        let dic = response.result.value as! [String : Any]
                        let str  =  String (describing: dic["hd"]!)
                        let str1  = String (describing: dic["hm"]!)
                        let str2  = String (describing: dic["hy"]!)

                        self.lblSDayValue?.text = str
                        self.lblSMonthValue?.text = str1
                        self.lblSYearValue?.text = str2
                 
//                        if self.iAutoSync == true
//                        {
//                            self.actionSyncData()
//                        }
//                        else
//                        {
//                            self.txtTitle.text = ""
                            self.txtDate.text = ""
                            self.strPickerDate = ""
                            self.txtMonth.text = ""
                            self.txtYear.text = ""
                            
 //                           self.txtTitle.textFieldDidChange()
                            self.txtDate.textFieldDidChange()
                            self.txtMonth.textFieldDidChange()
                            self.txtYear.textFieldDidChange()
//                        }

                    }
                    break

                case .failure(_):
                    print(response.result.error!)
                    break

                }
            }
        }
//        if iAutoSync == true
//        {
//            actionSyncData()
//        }
//        else
//        {
//            txtTitle.text = ""
//            txtDate.text = ""
//            strPickerDate = ""
//            txtMonth.text = ""
//            txtYear.text = ""
//
//            txtTitle.textFieldDidChange()
//            txtDate.textFieldDidChange()
//            txtMonth.textFieldDidChange()
//            txtYear.textFieldDidChange()
//        }
    }

    

//    @IBAction func btnActionBack(_ sender: UIButton)
//    {
//        self .dismiss(animated: true, completion: nil)
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCheckBoxYear(_ sender: UIButton)
    {
        if isCheck==false
        {
            isCheck = true
            btnCheckBox.setBackgroundImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
        }
        else
        {
            isCheck = false
            btnCheckBox.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
        }
    }

    func actionSyncData()
    {
//         checkDataStore()

            if txtDate.text == "" || txtDate.text == nil
            {
                if txtMonth.text == "" || txtMonth.text == nil
                {
                    if txtYear.text == "" || txtYear.text == nil
                    {
                        if txtTitle.text == "" || txtTitle.text == nil
                        {
                            let alert = UIAlertView()
                            //            alert.title = ""
                            alert.message = "Please select month"
                            alert.addButton(withTitle: "OK")
                            alert.show()
                            return
                        }
                        return
                    }
                    return
                }
            return
            }


        var strGetEventTitle = String()
        var strGetEventDate = Date()

        let dateComponents = NSDateComponents()
        dateComponents.day = Int(strD)!
        dateComponents.month = Int(strM)!
        dateComponents.year = Int(strY)!


        if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
            let mmdate = gregorianCalendar.date(from: dateComponents as DateComponents)
        {

            let predicate = eventStore.predicateForEvents(withStart: mmdate, end: mmdate.addingTimeInterval(60*60*24), calendars: calendars)

            let events = eventStore.events(matching: predicate) as [EKEvent]

            print("Events: \(events)")
            for event in events
            {
                strGetEventTitle = event.title;
                strGetEventDate = event.startDate;
            }

            if strGetEventTitle == txtTitle.text && strGetEventDate == mmdate
            {

            }
            else
            {
                let myLocalDic = NSMutableDictionary()
                
                if isCheck == true
                {
                   
                    
                    for i in 0 ... 100
                    {
                        let dateComponents = NSDateComponents()
                    
                        dateComponents.day = Int(strD)!
                        dateComponents.month = Int(strM)!
                        dateComponents.year = Int(strY)! + i

                        if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
                            let date = gregorianCalendar.date(from: dateComponents as DateComponents)
                        {
                            let weekday = gregorianCalendar.component(.year, from: date)
                            print(weekday)

                            let event:EKEvent = EKEvent(eventStore: eventStore)
                            event.title = txtTitle.text!
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
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
            
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    let dateStart = dateFormatter.string(from:mmdate as Date)
                    let dateEnd = dateFormatter.string(from:mmdate.addingTimeInterval(60*60*24) as Date)
                    
                    
                    myLocalDic .setObject(txtTitle.text, forKey: "Title" as NSCopying);
                    myLocalDic .setObject(dateStart, forKey: "Startdate" as NSCopying);
                    myLocalDic .setObject(dateEnd, forKey: "EndDate" as NSCopying);
                    
        
                }
                else
                {
                    let dateComponents = NSDateComponents()
              
                    dateComponents.day = Int(strD)!
                    dateComponents.month = Int(strM)!
                    dateComponents.year = Int(strY)!

                    if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
                        let date = gregorianCalendar.date(from: dateComponents as DateComponents)
                    {

                        let event:EKEvent = EKEvent(eventStore: eventStore)
                        event.title = txtTitle.text!
//                         event.title = ""
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
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    let dateStart = dateFormatter.string(from:mmdate as Date)
                    let dateEnd = dateFormatter.string(from:mmdate.addingTimeInterval(60*60*24) as Date)
                    
                    
                    myLocalDic .setObject(txtTitle.text, forKey: "Title" as NSCopying);
                    myLocalDic .setObject(dateStart, forKey: "Startdate" as NSCopying);
                    myLocalDic .setObject(dateEnd, forKey: "EndDate" as NSCopying);
                    
                }
                
                var arrList = NSArray()
               
                arrCustomList.removeAllObjects();
                
                if UserDefaults.standard.object(forKey: "CustomLst") != nil
                {
                    let userdefaults = UserDefaults.standard
                    arrList = userdefaults.array(forKey: "CustomLst")! as NSArray
                    
                    if (arrList.count > 0)
                    {
//                        var dic = NSMutableDictionar()
//
//                        for i in 0..<arrList.count
//                        {
//                            dic =
//                        }
                        var mutableDictionary = [String: AnyObject]()
                        
                       for i in 0..<arrList.count
                        {
                            mutableDictionary = arrList[i] as! [String : AnyObject]
                             arrCustomList .add(mutableDictionary)
                        }
//                         arrCustomList .add(mutableDictionary)
                    }
                
//                    arrCustomList = arrList as! NSMutableArray
                    arrCustomList .add(myLocalDic)
                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")

                } else
                {
                    arrCustomList .add(myLocalDic)
                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")

                }
                
//                if userdefaults.string(forKey: "CustomLst") != nil
//                {
//                    arrList = userdefaults.array(forKey: "CustomLst")! as NSArray
//                     arrCustomList = arrList as! NSMutableArray
//                    arrCustomList .add(myLocalDic)
//                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
//                }
//                else
//                {
//                    arrCustomList .add(myLocalDic)
//                    UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
//                }
                
                txtTitle.text = ""
                txtDate.text = ""
                strPickerDate = ""
                txtMonth.text = ""
                txtYear.text = ""
                btnCheckBox.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
                btnAutoSync.setBackgroundImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
                iAutoSync = false
                isCheck = false
               
                txtTitle.textFieldDidChange()
                txtDate.textFieldDidChange()
                txtMonth.textFieldDidChange()
                txtYear.textFieldDidChange()
            }
        }
       
//        uploadSampleData()
    }
    
    //-- Save to CoreData --//
//    func uploadSampleData(){
//        
//        //-- Get a tray first --//
//        let appDelegate = UIApplication.shared.delegate
//        let managedObjectContext = appDelegate.
//        
//        
//        let entity = NSEntityDescription.entityForName("Myevent", inManagedObjectContext: managedObjectContext)
//        
//        let paper = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
//        
//        
//        //-- put food on tray --//
//        paper.setValue("hello", forKey: "paper")
//        
//        allPapers.append(paper)
//        
//        var error: NSError?
//        
//        //-- put the tray inside refrigerator --//
//        
//        if managedObjectContext.save(&error) {
//            println("Couldn't save\(error?.userInfo)")
//        }
//        
//        
//        fetchPapers()
//        
//        
//    }
    
//    func checkDataStore()
//    {
//        var coreData = CoreDataStack1()
//        let moc = coreData.persistentContainer.viewContext
//        let request: NSFetchRequest<Myevent> = Myevent.fetchRequest()
//
//        do {
//            let bookCount = try moc.count(for: request)
//
//            if bookCount == 0 {
////                                uploadSampleData()
//            }
//        }
//        catch {
//            fatalError("Error in counting movie")
//        }
//    }
    
//    func uploadSampleData()
//    {
//        var coreData = CoreDataStack1()
//        let moc = coreData.persistentContainer.viewContext
////        let url = Bundle.main.url(forResource: "books", withExtension: "json")
////        let data = NSData(contentsOf: url!)
//
//        do {
////            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
////            let jsonArray = jsonResult.value(forKey: "books") as! NSArray
//
////            for json in jsonArray
////            {
////                let bookData = json as! [String: AnyObject]
//                let cusevent = Myevent(context: moc)
//
////                guard let name = bookData["name"] else {
////                    return
////                }
////                cusevent.eventTitle = name as? String
//                cusevent.eventTitle = txtTitle.text
//
//            let dateComponents = NSDateComponents()
//            dateComponents.day = Int(strD)!
//            dateComponents.month = Int(strM)!
//            dateComponents.year = Int(strY)!
//
//
//            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
//                let mmdate = gregorianCalendar.date(from: dateComponents as DateComponents)
//            {
//
////                guard let rating = bookData["rating"] else {
////                    return
////                }
////                cusevent.eventStartDate = rating.int16Value
//                cusevent.eventStartDate = mmdate as NSDate
//
//
////                guard let author = bookData["author"] else {
////                    return
////                }
////                cusevent.eventEndDate = author as? String
//                 cusevent.eventEndDate = mmdate.addingTimeInterval(60*60*1) as NSDate
//
////                guard let author = bookData["author"] else {
////                    return
////                }
////                cusevent.eventRepeat = author as? String
////                if isCheck == true
////                {
////                    cusevent.eventRepeat = isCheck
////                }
////                else
////                {
//                    cusevent.eventRepeat = isCheck
////                }
//
//            }
//
//                //                var image: UIImage?
//                //                if let bookImage = bookData["image"] {
//                //                    let imageName = bookImage as? String
//                //                    image = UIImage(named: imageName!)
//                //                    book.image = NSData.init(data: UIImageJPEGRepresentation(image!, 1)!) as Data
//                //                }
////            }
//
//            coreData.saveContext()
//        }
//        catch {
//            fatalError("Cannot upload sample data")
//        }
//    }
}


class dateOneCell: UITableViewCell
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


