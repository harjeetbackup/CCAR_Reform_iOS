//
//  EventManager.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 06/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit
import Alamofire

let kSelectedCalender = "CCTYPE"
let kIsraelCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"

let kDisporaCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"

let NotificationCalenderChange = NSNotification.Name.init("NotificationCalenderChange")

enum CalenderType {
    case israel;
    case dispora;
    case reform;
}

class EventManager: NSObject {
    static let shared: EventManager = EventManager()
    
    var israelEvents = [RLEvent]()
    var disporaEvents = [RLEvent]()
    var ReformEvents = [RLEvent]()
    var currentEvents = [RLEvent]()
    var selectedCalender : CalenderType = .reform
    
    func fetchEvents(_ completion: @escaping(([RLEvent]) -> Void)) {
        setCalenderType()
        
        if currentEvents.count > 0 {
            completion(currentEvents)
        } else {
            Alamofire.request(eventUrl(), method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                if let json = response.result.value as? [String: Any] {
                    if let array = json["items"] as? NSArray {
                        let items = RLEvent.modelsFromDictionaryArray(array:array)
                        self.currentEvents = items
                        completion(self.currentEvents)
                    }
                }
            }
        }
    }
    
    func setCalenderType() {
        let calender = UserDefaults.standard.string(forKey: kSelectedCalender)
        if calender == "ISEARL" {
            selectedCalender = .israel
        } else if calender == "REFORM" {
            selectedCalender = .reform
        } else if calender == "DIASPORA" {
            selectedCalender = .dispora
        } else {
            selectedCalender = .israel
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(EventManager.calenderChanged), name: NotificationCalenderChange, object: nil)
    }
    
    func calenderChanged() {
        self.currentEvents.removeAll()
        self.fetchEvents{_ in}
    }
        
    func eventUrl() -> String {
        if selectedCalender == .israel {
            return kIsraelCalenderURL
        } else if selectedCalender == .dispora {
            return kDisporaCalenderURL
        }
        // TODO: Need to work on this
        return kIsraelCalenderURL
        
    }
    
    func setToEvent(events: [RLEvent]) {
        
    }

}
