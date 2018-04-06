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
  
    static let shared: EventManager = {
        
        let obj = EventManager()
        obj.setCalenderType()
        return obj
    }()
    
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
        
        if yearLoaded < year {
            
            //set this so that it should not go inside again
            yearLoaded = year
            
            if selectedCalender == .reform {
                
                let isrealHolidaysUrl = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=\(year)&month=x&ss=on&mf=on&c=off&geo=none&m=50&s=off&o=on"
                
               let diasporaTorahUrl = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=off&min=off&mod=off&nx=off&year=\(year)&month=x&ss=off&mf=off&c=off&geo=none&m=50&s=on&o=off"
                
                loadEvents(url: isrealHolidaysUrl, completion: { (isrealHolidaysUrlitems) in
                    self.events = self.events + isrealHolidaysUrlitems
                    self.loadEvents(url: diasporaTorahUrl, completion: { (diasporaTorahUrlitems) in
                        self.events = self.events + diasporaTorahUrlitems
                        completion(self.events)
                    })
                })
            } else {
                self.loadEvents(url: eventUrl(year: year), completion: { (items) in
                    self.events = self.events + items
                    completion(self.events)
                })
            }
            
        } else {
            if self.events.count != 0 {
                completion(self.events)
            }
        }
    }

    func loadEvents(url: String, completion: @escaping(([RLEvent]) -> Void)) {
        
        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let json = response.result.value as? [String: Any] {
                if let array = json["items"] as? NSArray {
                    let items = RLEvent.modelsFromDictionaryArray(array:array)
                    completion(items)
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
