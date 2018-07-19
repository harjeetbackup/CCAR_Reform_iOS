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
let NotificationCalenderChangeNewEventsDidLoaded = NSNotification.Name.init("NotificationCalenderChangeNewEventsDidLoaded")
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
        NotificationCenter.default.addObserver(obj, selector: #selector(EventManager.calenderDidChange), name: NotificationCalenderChange, object: nil)
        return obj
    }()

    var events = [RLEvent]()
    var yearSyncfilteredItems = [RLEvent]()
    var selectedCalender : CalenderType = .reform
    var yearLoaded = 0
    var yearLoadedFromSync = [String]()
    
    let kSelectedCalender = "CCTYPE"
    let kIsraelCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    let kDisporaCalenderURL = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=2017&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    
    func fetchEvents(year:Int, isFromEventsTab:Bool, yearSelectedForSync: [String], _ completion: @escaping(([RLEvent]) -> Void)) {
        
        if yearLoaded < year {
            //set this so that it should not go inside again
            
            if isFromEventsTab == true {
                yearLoaded = year
            } else {
                yearLoadedFromSync = yearSelectedForSync
            }
            
            if selectedCalender == .reform {
                
                let isrealHolidaysUrl = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=\(year)&month=x&ss=on&mf=on&c=off&geo=none&m=50&s=off&o=on"
                
                let diasporaTorahUrl = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=off&min=off&mod=off&nx=off&year=\(year)&month=x&ss=off&mf=off&c=off&geo=none&m=50&s=on&o=off"
                
                let diasporaTorahSpecialUrl = "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=off&mod=off&nx=off&year=\(year)&month=x&ss=off&mf=off&c=off&geo=none&m=0&s=off&o=off"
                
                loadEvents(url: isrealHolidaysUrl, completion: { (isrealHolidaysUrlitems) in
                    
                    var currentYearEvents = isrealHolidaysUrlitems
                    self.loadEvents(url: diasporaTorahUrl, completion: { (diasporaTorahUrlitems) in
                        let dEvents = diasporaTorahUrlitems
                        currentYearEvents = currentYearEvents + diasporaTorahUrlitems
                        
                        self.loadEvents(url: diasporaTorahSpecialUrl, completion: { (specialItems) in
                            
                            var specialDiasporaEvents =  specialItems + dEvents
                            // Sort
                            specialDiasporaEvents = self.sortedCurrentYearEvents(specialDiasporaEvents)
                            
                            currentYearEvents = currentYearEvents + self.applyReformLogic(events: specialDiasporaEvents);
                            currentYearEvents = self.sortedCurrentYearEvents(currentYearEvents)
                            self.applySubTitleLogic(currentYearEvents)
                            self.events = self.events + currentYearEvents
                            completion(self.events)
                        })
                    })
                })
            } else if selectedCalender == .dispora {
                self.loadEvents(url: eventUrl(year: year), completion: { (items) in
                    self.events = self.events + items
                    self.applySubTitleLogic(self.events)
                    completion(self.events)
                })
            } else {
                self.loadEvents(url: eventUrl(year: year), completion: { (items) in
                    self.events = self.events + items
                    self.applySubTitleLogic(self.events)
                    completion(self.events)
                })
            }
            
        } else {
            completion(self.events)
        }
    }
    
    func sortedCurrentYearEvents(_ events:[RLEvent]) -> [RLEvent] {
        let currentYearEvents = events.sorted { (ev1, ev2) -> Bool in
            
            if let date1Str = ev1.date, let date2Str = ev2.date {
                dateFormater.dateFormat = "yyyy-MM-dd"
                if let date1 = dateFormater.date(from: date1Str), let date2 = dateFormater.date(from: date2Str) {
                    if date1.compare(date2) != .orderedDescending {
                        return true
                    } else {
                        return false
                    }
                }
            }
            return false
        }
        
        return currentYearEvents
    }

    func loadEvents(url: String, completion: @escaping(([RLEvent]) -> Void)) {
        
        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print("url:\(url)")
            if let json = response.result.value as? [String: Any] {
                if let array = json["items"] as? NSArray {
                    let items = RLEvent.modelsFromDictionaryArray(array:array)
                    let filteredItems = items.filter({ (event) -> Bool in
                        if event.title == "Sigd" {
                            return false
                        } else {
                            return true
                        }
                    })
//                    for year in self.yearLoadedFromSync {
//                        self.yearSyncfilteredItems = filteredItems.filter({ (event) -> Bool in
//                            if "\(event.date?.getYear())" == year {
//                                return false
//                            } else {
//                                return true
//                            }
//                        })
//                    }
                        completion(filteredItems)
                }
            }
        }
    }
    
    func calenderDidChange() {
        EventManager.shared.events.removeAll()
        EventManager.shared.setCalenderType()
        EventManager.shared.yearLoaded = 0
        self.fetchEvents(year: currentYear(), isFromEventsTab: true, yearSelectedForSync: []) { _ in
            NotificationCenter.default.post(name: NotificationCalenderChangeNewEventsDidLoaded, object: nil)
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
    
    func currentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
    
}
extension String {
    func getYear() -> Int {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return calendar.component(.year, from: date!)
    }
}
