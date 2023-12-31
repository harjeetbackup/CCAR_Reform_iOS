//
//  SettingVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/17/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation

class SettingVC: UIViewController {

    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnReform: UIButton!
    @IBOutlet weak var btnIsreal: UIButton!
    @IBOutlet weak var btnDiaspora: UIButton!
    @IBOutlet weak var HeaderImage: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    var claType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnUpdate?.layer.cornerRadius = (btnUpdate?.frame.size.height)!/2;
        btnUpdate?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8324027032);
        btnUpdate?.layer.borderWidth = 1;
        btnUpdate?.layer.masksToBounds = true;
    }
    
    @IBAction func btnActionBAck(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        var  btnTagValue = String()
        if UserDefaults.standard.object(forKey: "CCTYPE") != nil {
            btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")!
        } else {
            let ad = "REFORM"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
        }
        if btnTagValue == "REFORM" {
            calTypeName = "R"
            btnReform.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
        } else if btnTagValue == "ISEARL" {
            calTypeName = "I"
            btnIsreal.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
        } else if btnTagValue == "DIASPORA" {
             calTypeName = "D"
            btnDiaspora.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
        }
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }

    func myBackGraound(strmonth: NSInteger) {
        let strimagename = "commanHeader" + "\(strmonth)"
        HeaderImage .image = UIImage(named: strimagename)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func btnCheckCalType(_ sender: UIButton) {
        if sender.tag == 501 {
            let ad = "REFORM"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
            btnIsreal.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
        } else if sender.tag == 502 {
            let ad = "ISEARL"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
            btnIsreal.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
        } else if sender.tag == 503 {
            let ad = "DIASPORA"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
            btnReform.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
            btnIsreal.setImage(UIImage(named: "Calender_Unselect"), for: UIControl.State.normal)
            btnDiaspora.setImage(UIImage(named: "Calender_select"), for: UIControl.State.normal)
        }
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NotificationCalenderChange, object: nil)
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        self .dismiss(animated: true, completion: nil)
    }
}
