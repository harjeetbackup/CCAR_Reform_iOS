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
    var currentEvents = [RLEvent]()
    var selectedCalender : CalenderType = .reform
    
    let kSelectedCalender = "CCTYPE"
    let kIsraelCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    let kDisporaCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    func fetchEvents(eventType:EventType,year:Int,_ completion: @escaping(([RLEvent]) -> Void)) {
        setCalenderType()
        Alamofire.request(eventUrl(year: year), method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let json = response.result.value as? [String: Any] {
                if let array = json["items"] as? NSArray {
                    let items = RLEvent.modelsFromDictionaryArray(array:array)
                    if eventType == .all {
                        self.currentEvents = items
                        for item in items {
                           if let cat = item.category {
                                if cat == "omer" {
                                    item.link = "http://www.hebcal.com/holidays/lag-baomer"
                                }
                            }
                        }
                        completion(self.currentEvents)
                    }
                    if eventType == .parshat {
                        let filered = items.filter({ (event) -> Bool in
                            if let cat = event.category {
                                if cat == "parashat" {
                                    return true
                                }
                            }
                            return false
                        })
                        completion(filered)
                    }
                    if eventType == .holiday {
                        let filered = items.filter({ (event) -> Bool in
                            if let cat = event.category {
                                if cat == "holiday" {
                                    return true
                                }
                                if cat == "omer" {
                                    event.link = "http://www.hebcal.com/holidays/lag-baomer"
                                    return true
                                }
                                if cat == "roshchodesh" {
                                    return true
                                }
                            }
                            return false
                        })
                        completion(filered)
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
        self.fetchEvents(eventType: .all, year: 2017){_ in}
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
    
    func setToEvent(events: [RLEvent]) {
        
    }

}
