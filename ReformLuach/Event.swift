//
//  SecondViewController.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/22/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation

//import GLViewPagerViewController

//GLViewPagerViewController,GLViewPagerViewControllerDataSource,GLViewPagerViewControllerDelegate
//class Event: UIViewController, UITableViewDelegate, UITableViewDataSource
class Event: GLViewPagerViewController, GLViewPagerViewControllerDataSource, GLViewPagerViewControllerDelegate
{
    
//    @IBOutlet var headerView: UIView!
    var headerView: UIView!
    var viewControllers: NSArray = NSArray()
    var tabTitles: NSArray = NSArray()
    var myView: UIView!
    
    
    var controller1: EventFirstVC?
    var controller2: EventSecondVC?
    var controller3: EventThirdVC?
    
    
 
    
    var vvv : GLViewPagerViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

        self.navigationItem.title = "Paged Tabs"
        self.setDataSource(newDataSource: self)
        self.setDelegate(newDelegate: self)
        self.padding = 10
        self.leadingPadding = 10
        self.trailingPadding = 10
        self.defaultDisplayPageIndex = 0
        self.tabAnimationType = GLTabAnimationType.GLTabAnimationType_WhileScrolling
        //        self.indicatorColor = UIColor.init(colorLiteralRed: 255.0 / 255.0, green: 205.0 / 255.0, blue: 0.0, alpha: 1.0)
        self.indicatorColor = UIColor.init(colorLiteralRed: 1.0/255.0, green: 186.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        
        self.supportArabic = false
        self.fixTabWidth = false
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main",bundle:Bundle.main)
        
        if !(controller1 != nil)
        {
            controller1 = mainStoryboard.instantiateViewController(withIdentifier: "EventFirstVC") as? EventFirstVC
            controller2 = mainStoryboard.instantiateViewController(withIdentifier: "EventSecondVC") as? EventSecondVC
            controller3 = mainStoryboard.instantiateViewController(withIdentifier: "EventThirdVC") as? EventThirdVC
        }
        controller1?.myNavController = navigationController
        
        controller2?.myNavController = navigationController
        
        controller3?.myNavController = navigationController

        
        
        
//        self.view.addSubview(headerView)
        
//        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 180)
        
//        self.view.addSubview(self.myView)
        
//        let myView = GLViewPagerViewController.pageViewController(GLViewPagerViewController)
        
        
//        self.view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
//        headerView.bringSubview(toFront: subbView);
        
       
//        let firstViewController EventFirstVC = mainStoryboard.instantiateViewController(withIdentifier: "EventFirstVC") as! EventFirstVC
//        firstViewController.myNavController = self.navigationController
//
//        let secondViewController: EventSecondVC = mainStoryboard.instantiateViewController(withIdentifier: "EventSecondVC") as! EventSecondVC
//        secondViewController.myNavController = self.navigationController
//
//        let ThirdViewController: EventThirdVC = mainStoryboard.instantiateViewController(withIdentifier: "EventThirdVC") as! EventThirdVC
//        ThirdViewController.myNavController = self.navigationController
        
        self.viewControllers =
            [
//           firstViewController,
//           secondViewController,
//           ThirdViewController
           
                controller1,
                controller2,
                controller3
                
//            EventFirstVC.init(title: "Page one"),
//            EventSecondVC.init(title: "Page Two"),
//            EventThirdVC.init(title: "Page Three")
        ]
        
        self.tabTitles = [ "ALL",
                           "PARSHIYOT" ,
                           "HOLIDAYS"]
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(overrideswipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(overrideSwipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.CallRightMove(notification:)), name: Notification.Name("NotificationMoveRight"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.CallLeftMove(notification:)), name: Notification.Name("NotificationMoveLeft"), object: nil)
    }
    
    
    @objc func CallLeftMove(notification: Notification)
    {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, 2)
        
    }
    
    @objc func CallRightMove(notification: Notification)
    {
         tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    func overrideswipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)

    }

    func overrideSwipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)

//        self.myView .addSubview(headerView)

    }
    
    
    // MARK: - GLViewPagerViewControllerDataSource
    func numberOfTabsForViewPager(_ viewPager: GLViewPagerViewController) -> Int
    {
        return self.viewControllers.count
    }
    
    func viewForTabIndex(_ viewPager: GLViewPagerViewController, index: Int) -> UIView {
        let label:UILabel = UILabel.init()
        label.text = self.tabTitles.object(at: index) as? String
        //        label.textColor = UIColor.init(colorLiteralRed: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        label.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        label.textAlignment = NSTextAlignment.center
        //        label.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        label.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        return label
    }
    
    func contentViewControllerForTabAtIndex(_ viewPager: GLViewPagerViewController, index: Int) -> UIViewController {
        return self.viewControllers.object(at: index) as! UIViewController
    }
    
    // MARK: - GLViewPagaerViewControllerDelegate
    func didChangeTabToIndex(_ viewPager: GLViewPagerViewController, index: Int, fromTabIndex: Int) {
        let prevLabel:UILabel = viewPager.tabViewAtIndex(index: fromTabIndex) as! UILabel
        let currentLabel:UILabel = viewPager.tabViewAtIndex(index: index) as! UILabel
        //        prevLabel.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        //        currentLabel.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        prevLabel.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        currentLabel.textColor = UIColor.init(colorLiteralRed: 1.0/255.0, green: 183.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    }
    
    func willChangeTabToIndex(_ viewPager: GLViewPagerViewController, index: Int, fromTabIndex: Int, progress: CGFloat) {
        if fromTabIndex == index {
            return;
        }
        
        let prevLabel:UILabel = viewPager.tabViewAtIndex(index: fromTabIndex) as! UILabel
        let currentLabel:UILabel = viewPager.tabViewAtIndex(index: index) as! UILabel
        prevLabel.transform = CGAffineTransform.identity.scaledBy(x: 1.0 - (0.1 * progress), y: 1.0 - (0.1 * progress))
        currentLabel.transform = CGAffineTransform.identity.scaledBy(x: 0.9 + (0.1 * progress), y: 0.9 + (0.1 * progress))
        //        currentLabel.textColor =  UIColor.init(colorLiteralRed: Float(0.3 + 0.2 * progress), green: Float(0.3 - 0.3 * progress), blue: Float(0.3 + 0.2 * progress), alpha: 1.0)
        currentLabel.textColor =  UIColor.init(colorLiteralRed: 1.0/255.0, green: 183.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        prevLabel.textColor = UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    }
    
    func widthForTabIndex(_ viewPager: GLViewPagerViewController, index: Int) -> CGFloat {
        let prototypeLabel:UILabel = UILabel.init()
        prototypeLabel.text = self.tabTitles.object(at: index) as? String
        prototypeLabel.textAlignment = NSTextAlignment.center
        prototypeLabel.font = UIFont.systemFont(ofSize: 16.0)
        //        return prototypeLabel.intrinsicContentSize.width
        //        prototypeLabel.intrinsicContentSize.width = self.view.frame.size.width/3;
        return (self.view.frame.size.width/3) - 10;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func DisplayTopView(_ viewPager: GLViewPagerViewController) -> UIView
//    {
//
//
//        headerView = UIView(frame:CGRect(x:0, y:0, width:self.view.frame.width, height:180))
//        headerView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        return headerView;
//    }
    
    
//    @IBOutlet weak var ButtonView: UIView!
//    @IBOutlet weak var btnParshiyot: UIButton!
//    @IBOutlet weak var btnHoliday: UIButton!
//    @IBOutlet weak var btnRoshChodesh: UIButton!
//    @IBOutlet weak var tblEvent: UITableView!
//
//
//
//
//    let Holi = ["Rosh chodush", "Yom Kippur", "Sukkot", "Simchat Torah","HanuKKah", "TU BiShvat"]
//
//    let Year = ["2015", "2016", "2015", "2018","2016", "2017"]
//
//    let B1Color = UIColor.init(colorLiteralRed: 0, green: 163, blue: 212, alpha: 0)
//    let B2Color = UIColor.init(colorLiteralRed: 115, green: 115, blue: 115, alpha: 0)
//
//
//    var tableTag = String()
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//            return .portrait
//        }
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    override func viewDidAppear(_ animated: Bool)
//    {
//        super.viewDidAppear(true)
//
//        var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//            return .portrait
//        }
//
//        btnParshiyot.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnHoliday.setTitleColor(UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnRoshChodesh.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//       // btnHoliday.addTarget(self, action: #selector(getter: btnHoliday),for: .touchUpInside)
//
//
//        newbtnHoliday(btnHoliday)
//
//    }
//
//    @IBAction func btnParshiyot(_ sender: UIButton)
//    {
//        tableTag = "PARSHIYOT"
//
//        btnParshiyot.setTitleColor(UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnHoliday.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnRoshChodesh.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//
//        self.drawBottomSeprateLine(btnParshiyot, lineColor: UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0))
//        self.drawBottomSeprateLine(btnHoliday, lineColor: UIColor.white)
//        self.drawBottomSeprateLine(btnRoshChodesh, lineColor: UIColor.white)
//
//        tblEvent.reloadData()
//    }
//
//    @IBAction func newbtnHoliday(_ sender: UIButton)
//    {
//        tableTag = "HOLIDAY"
//
//        btnParshiyot.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnHoliday.setTitleColor(UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnRoshChodesh.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        self.drawBottomSeprateLine(btnParshiyot, lineColor: UIColor.white)
//        self.drawBottomSeprateLine(btnHoliday, lineColor: UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0))
//        self.drawBottomSeprateLine(btnRoshChodesh, lineColor: UIColor.white)
//
//        tblEvent.reloadData()
//
//    }
//
//    @IBAction func btnRoshChodesh(_ sender: UIButton)
//    {
//        tableTag = "ROSH"
//
//        btnParshiyot.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnHoliday.setTitleColor(UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0), for: .normal)
//
//        btnRoshChodesh.setTitleColor(UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0), for: .normal)
//
//        self.drawBottomSeprateLine(btnParshiyot, lineColor: UIColor.white)
//        self.drawBottomSeprateLine(btnHoliday, lineColor: UIColor.white)
//        self.drawBottomSeprateLine(btnRoshChodesh, lineColor: UIColor(red: 0.0 / 255.0, green: 163.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0))
//
//        tblEvent.reloadData()
//
//    }
//
//
//
//    func drawBottomSeprateLine(_ button: UIButton, lineColor color: UIColor) {
////        let maximumSize = CGSize(width: 300, height: 9999)
////        let myFont = UIFont(name: "Montserrat-Regular", size: 15)
//
////        let ButtonTitleSize: CGFloat? = button.titleLabel?.text?.size(with: myFont, constrainedTo: CGSize(width: 300, height: 9999), lineBreakMode: .wordWrap)?.width
//
//
//
//        let bottomBorder = CALayer()
//            bottomBorder.frame = CGRect(x: 0.0, y: button.frame.size.height-2, width: button.frame.size.width, height: 2.0);
////        bottomBorder.frame = CGRect(x: (button.frame.size.width - ButtonTitleSize!) / 2, y: button.frame.size.height - 2, width: ButtonTitleSize!, height: 2.0)
//        bottomBorder.backgroundColor = color.cgColor
//        button.layer.addSublayer(bottomBorder)
//    }
//
//
//
//    //Mark -- Tableview
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        if tableTag == "PARSHIYOT"
//        {
//            return Holi.count
//        }
//        else if tableTag == "ROSH"
//        {
//            return Holi.count;
//        }
//        else
//        {
//            return Holi.count;
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let identifier = "CustomEventCell"
//        let cell: CustomEventCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomEventCell
//        if tableTag == "PARSHIYOT"
//        {
//            cell.lblFestTitle.text = Holi[indexPath.row]
//            cell.lblFestDate.text = Year[indexPath.row]
//        }
//        else if tableTag == "ROSH"
//        {
//            cell.lblFestTitle.text = Holi[indexPath.row];
//            cell.lblFestDate.text = Year[indexPath.row]
//        }
//        else
//        {
//            cell.lblFestTitle.text = Holi[indexPath.row]
//            cell.lblFestDate.text = Year[indexPath.row]
//        }
//        return cell
//    }
//
//
//
//
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let identifier = "CustomEventCell"
////        let cell: CustomEventCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomEventCell
////        if tableTag == "PARSHIYOT"
////        {
////            cell.lblFestTitle.text = Holi[indexPath.row]
////            cell.lblFestDate.text = Year[indexPath.row]
////        }
////        else if tableTag == "ROSH"
////        {
////            cell.lblFestTitle.text = Holi[indexPath.row];
////            cell.lblFestDate.text = Year[indexPath.row]
////        }
////        else
////        {
////            cell.lblFestTitle.text = Holi[indexPath.row]
////            cell.lblFestDate.text = Year[indexPath.row]
////        }
////
////
////        //        }
////        return cell
////
////    }

    func filterTextFirst(searchText: String?)
    {
//        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Subject", searchBar.text!)
//        arrParshita = (arrTotalParshita as NSArray).filtered(using: predicate) as NSArray
//
//        tblParshiyot.reloadData()
    }
    
    func filterClearFirst(searchText: String?)
    {
//        arrParshita = arrTotalParshita as NSArray
//        tblParshiyot.reloadData()
    }

}


//class CustomEventCell: UITableViewCell
//{
//
//
//    @IBOutlet weak var lblFestTitle: UILabel!
//    @IBOutlet weak var lblFestDate: UILabel!
//
//
//
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

