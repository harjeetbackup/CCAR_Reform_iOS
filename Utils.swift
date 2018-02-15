//
//  Utils.swift
//  Foreera
//
//  Created by Admin on 12/25/17.
//  Copyright © 2017 Foreera. All rights reserved.
//

import UIKit

class Utils {

    static func getMainNVC() -> UIViewController {

        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
    }
    
    static func getSettingVC() -> SettingVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
    }
    
}
