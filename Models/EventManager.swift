//
//  EventManager.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 06/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import UIKit
import Alamofire

let NotificationCalenderChange = NSNotification.Name.init("NotificationCalenderChange")

enum CalenderType {
    case israel;
    case dispora;
    case reform;
}
enum EventType {
    case all;
    case parshat;
    case holiday;
    case none;
}
var eventType: EventType?
class EventManager: NSObject {
  
    static let shared: EventManager = EventManager()
    var israelEvents = [RLEvent]()
    var disporaEvents = [RLEvent]()
    var ReformEvents = [RLEvent]()
    var events = [RLEvent]()
    var selectedCalender : CalenderType = .reform
    var yearLoaded = 0
    
    let kSelectedCalender = "CCTYPE"
    let kIsraelCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    let kDisporaCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    func fetchEvents(eventType:EventType,year:Int,_ completion: @escaping(([RLEvent]) -> Void)) {
        setCalenderType()
        
        if yearLoaded < year {
            
            //set this so that it should not go inside again
            yearLoaded = year
            
            Alamofire.request(eventUrl(year: year), method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                if let json = response.result.value as? [String: Any] {
                    if let array = json["items"] as? NSArray {
                        let items = RLEvent.modelsFromDictionaryArray(array:array)
                        self.events = self.events + items
                        completion(self.events)
                    }
                }
            }
        } else {
            completion(events)
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
    }
        
    func eventUrl(year:Int) -> String {
        
        let showYear = String(year)

        if selectedCalender == .israel {
            return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
        } else if selectedCalender == .dispora {
            return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
        }
        // TODO: Need to work on this
        return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
        
    }

}
