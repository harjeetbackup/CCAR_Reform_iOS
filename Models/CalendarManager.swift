//
//  CalendarManager.swift
//  ReformLuach
//
//  Created by Niranjan on 7/13/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation
import UIKit

class CalendarManager: NSObject {
    
    static let shared: CalendarManager = {
        let object = CalendarManager()
        if let dict = UserDefaults.standard.value(forKey: "calendarSyncedEvents") as? [NSDictionary] {
            object.setWith(array: dict)
        }
        return object
    }()
    public var calendarSyncEvents: [CalendarSyncEvent]?
    
    public func setWith(array: [NSDictionary]) {
        calendarSyncEvents = CalendarSyncEvent.modelsFromDictionaryArray(array: array as NSArray)
    }
    
    public func saveWith(array: [NSDictionary]) {
        setWith(array: array)
        UserDefaults.standard.setValue(array, forKey: "calendarSyncedEvents")
        UserDefaults.standard.synchronize()
    }
}
