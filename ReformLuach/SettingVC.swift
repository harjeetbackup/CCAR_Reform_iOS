//
//  SettingVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/17/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation

class SettingVC: UIViewController
{

    @IBOutlet weak var btnUpdate: UIButton!
    
    @IBOutlet weak var btnReform: UIButton!
    @IBOutlet weak var btnIsreal: UIButton!
    @IBOutlet weak var btnDiaspora: UIButton!

    
    @IBOutlet weak var HeaderImage: UIImageView!
    
    var claType: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnUpdate?.layer.cornerRadius = (btnUpdate?.frame.size.height)!/2;
        btnUpdate?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8324027032);
        btnUpdate?.layer.borderWidth = 1;
        btnUpdate?.layer.masksToBounds = true;
        
    }
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func btnActionBAck(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
        //self .dismiss(animated: true, completion: nil)
    }
    override func viewDidLayoutSubviews()
    {
//        let btnTagValue = UserDefaults.standard.value(forKey: "CCTYPE") as! String
        var  btnTagValue = String()
        
        if UserDefaults.standard.object(forKey: "CCTYPE") != nil
        {
            btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")!
        }
        else
        {
            let ad = "REFORM"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
        }
        
//        btnTagValue = UserDefaults.standard.object(forKey: "CCTYPE") as? String ?? "REFORM"
        
//         btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")!
//        var UserStatus:String {
//            get{
//                return UserDefaults.standard.object(forKey: "pref_Foo") as? String ?? "0"
//            }
//            set(status){
//                let ad = "REFORM"
//                UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
//                UserDefaults.standard.set(status, forKey: "pref_Foo")
//                UserDefaults.standard.synchronize()
//            }
//        }

        
        
//       if UserDefaults.standard.string(forKey: "CCTYPE")! == nil
//       {
//            let ad = "REFORM"
//            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
//        }
//       else
//       {
//            btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")!
//        }
       

//        if btnTagValue == "" || btnTagValue == nil
//        {
//            UserDefaults.standard.set("REFORM", forKey: "CCTYPE")
//        }
       
        if btnTagValue == "REFORM"
        {
            btnReform.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
        }
        else if btnTagValue == "ISEARL"
        {
            btnIsreal.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
        }
        else if btnTagValue == "DIASPORA"
        {
            btnDiaspora.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
        }
       
       
        
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }

   
    func myBackGraound(strmonth: NSInteger)
     {
        let strimagename = "commanHeader" + "\(strmonth)"
        HeaderImage .image = UIImage(named: strimagename)
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCheckCalType(_ sender: UIButton)
    {
        
        if sender.tag == 501
        {
            let ad = "REFORM"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
            btnIsreal.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            self .dismiss(animated: true, completion: nil)
        }
        else if sender.tag == 502
        {
            let ad = "ISEARL"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            btnIsreal.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            self .dismiss(animated: true, completion: nil)
        }
        else if sender.tag == 503
        {
            let ad = "DIASPORA"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            btnIsreal.setImage(UIImage(named: "Calender_Unselect"), for: UIControlState.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_select"), for: UIControlState.normal)
            self .dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnUpdate(_ sender: UIButton)
    {
        self .dismiss(animated: true, completion: nil)
    }
    

}
