//
//  Constants.swift
//  
//
//  Created by Deeksha on 7/30/18.
//

import Foundation

let kcalTypeKey = "kcalTypeKey"

var calTypeName: String! {
    get {
        if let calName =  UserDefaults.standard.string(forKey: kcalTypeKey) {
            return calName
        } else {
            return nil
        }
    } set {
        UserDefaults.standard.set(newValue, forKey: kcalTypeKey)
    }
}
