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
    
    func url(year:Int) -> String {
        let showYear = String(year)
        if self == .israel {
            return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
        } else if self == .dispora {
            return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=off&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
        }
        return "http://www.hebcal.com/hebcal/?v=1&cfg=json&i=on&maj=on&min=on&mod=on&nx=on&year=" + showYear + "&month=x&ss=on&mf=on&c=off&geo=none&m=0&s=on&o=on"
    }
}

enum EventType {
    case all;
    case parshat;
    case holiday;
    case none;
}
var eventType: EventType?
var roshEventTitle: String?

class EventManager: NSObject {
    
    static let shared: EventManager = {
        let obj = EventManager()
        obj.setCalenderType()
        NotificationCenter.default.addObserver(obj, selector: #selector(EventManager.calenderDidChange), name: NotificationCalenderChange, object: nil)
        return obj
    }()
    
    var events = [RLEvent]()
    var yearsLoaded: Set = Set<Int>()
    var selectedCalender : CalenderType = .reform
    var yearLoaded = 0
    let kSelectedCalender = "CCTYPE"
    
    func getEvents(year:Int, _ completion: @escaping(([RLEvent]) -> Void)) {
        if yearLoaded < year {
            yearLoaded = year
            yearsLoaded.insert(year)
            fetchEventsFor(calenderType: selectedCalender, year: year, { newEvents in
                self.events = self.events + newEvents
                completion(self.events)
            })
        } else {
            completion(self.events)
        }
    }
    
    func fetchEventsFor(calenderType: CalenderType = EventManager.shared.selectedCalender, year:Int, _ completion: @escaping(([RLEvent]) -> Void)) {
        if calenderType == .reform {
            
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
                        self.applySubtitleForsukkotAndChanukhaEvents(currentYearEvents)
                        self.applySaturdayFridayTitleChangeLogic(currentYearEvents)
                        completion(currentYearEvents)
                    })
                })
            })
        } else if calenderType == .dispora {
            self.loadEvents(url: calenderType.url(year: year), completion: { (items) in
                self.applySubTitleLogic(items)
                self.applySubtitleForsukkotAndChanukhaEvents(items)
                self.applySaturdayFridayTitleChangeLogic(items)
                completion(items)
            })
        } else {
            self.loadEvents(url: calenderType.url(year: year), completion: { (items) in
                self.applySubTitleLogic(items)
                self.applySubtitleForsukkotAndChanukhaEvents(items)
                self.applySaturdayFridayTitleChangeLogic(items)
                completion(items)
            })
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
                    var filteredItems = items.filter({ (event) -> Bool in
                        if event.title == "Sigd" {
                            return false
                        } else {
                            return true
                        }
                    })
                    
                    for event in filteredItems {
                        if let event1 = event.title, let event1Date = event.date {
                            if event1.hasPrefix("Rosh Chodesh") {
                                let rDate = self.getPreviousDay(dateInString: event1Date)
                                let roshEvent = RLEvent(dictionary: NSDictionary())
                                roshEvent?.title = "Erev Rosh Chodesh Weekday"
                                roshEvent?.date = rDate
                                roshEvent?.spellChangedTitle = "Erev Rosh Chodesh Weekday"
                                roshEvent?.spellChanged = "Erev Rosh Chodesh Weekday"
                                if let index = self.getEventIndex(filteredEvents: filteredItems, event: event) {
                                    if roshEventTitle != event1 {
                                        if index == 0 {
                                            roshEventTitle = event1
                                            filteredItems.insert(roshEvent!, at: index)
                                        } else {
                                            roshEventTitle = event1
                                            filteredItems.insert(roshEvent!, at: index - 1)
                                        }
                                    }
                                } else {
                                    print("Index failed to get")
                                }
                            } else {
                                continue
                            }
                        }
                    }
                    completion(filteredItems)
                }
            }
        }
    }
    
    func getEventIndex(filteredEvents:[RLEvent],event:RLEvent) -> Int? {
        return filteredEvents.index(where: { (event1) -> Bool in
            if event1.title == event.title {
                return true
            } else {
                return false
            }
        })
    }
    
    func calenderDidChange() {
        EventManager.shared.events.removeAll()
        EventManager.shared.setCalenderType()
        EventManager.shared.yearLoaded = 0
        self.getEvents(year: currentYear()) { _ in
            NotificationCenter.default.post(name: NotificationCalenderChangeNewEventsDidLoaded, object: nil)
        }
    }
    
    func setCalenderType() {
        let calender = UserDefaults.standard.string(forKey: kSelectedCalender)
        if calender == "ISEARL" {
            calTypeName = "I"
            selectedCalender = .israel
        } else if calender == "REFORM" {
            calTypeName = "R"
            selectedCalender = .reform
        } else if calender == "DIASPORA" {
            calTypeName = "D"
            selectedCalender = .dispora
        } else {
            calTypeName = "I"
            selectedCalender = .israel
        }
    }
    
    func currentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
    
    func getPreviousDay(dateInString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: dateInString)
        let prev = date?.getPreviousDate(date: date!)
        return formatter.string(from: prev!)
    }
}

extension Date {
    func getPreviousDate(date :Date) -> Date {
        let calendar = NSCalendar.current
        return calendar.date(byAdding: .day, value: -1, to: date)!
    }
}
