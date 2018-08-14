//
//  EventManager+ReformLogic.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 14/04/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

let dateFormater = DateFormatter()

extension EventManager {
    
    func applyReformLogic(events: [RLEvent]) -> [RLEvent] {
        var specialEvents = [RLEvent]()
        specialEvents = specialEvents + self.applyPesachEventLogic(events: events)
        specialEvents = specialEvents + self.applyShavuotEventLogic(events: events)
        specialEvents = specialEvents + self.applyAchareiMotEventLogic(events: events)
        return specialEvents
    }
    
    func applyPesachEventLogic(events: [RLEvent]) -> [RLEvent] {
        var specialEvents = [RLEvent]()
        var pesachEvent: RLEvent? = nil
        var nextWeekDateStr: String? = nil
        
        for ev in events {
            print(ev.title ?? "nil")
            if let title = ev.title, title == "Pesach VIII" && ev.yomtov == true {
                pesachEvent = ev
                if let eventDateStr = ev.date {
                    dateFormater.dateFormat = "yyyy-MM-dd"
                    if let eventDate = dateFormater.date(from: eventDateStr) {
                        if let nextWeekDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 7, to: eventDate) {
                            
                            // Checking for Saturday
                            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian) {
                                let weekday = gregorianCalendar.component(.weekday, from: nextWeekDate)
                                if weekday == 7 { // 7 Means Saturday
                                    nextWeekDateStr = dateFormater.string(from: nextWeekDate)
                                }
                            }
                        }
                    }
                }
            }
            // Next level Check:
            
            guard let title = ev.title, title == "Parashat Shmini",
                let ed = ev.date, let dateToComaper = nextWeekDateStr,
                ed == dateToComaper, let pEvent = pesachEvent else { continue }
            
            pEvent.title = "Parashat Shmini I"
            pEvent.category = "parashat"
            pEvent.subcat = ""
            ev.title = "Parashat Shmini II"
            specialEvents.append(pEvent)
        }
        return specialEvents
    }
    
    func applyShavuotEventLogic(events: [RLEvent])  -> [RLEvent] {
        var specialEvents = [RLEvent]()
        var pesachEvent: RLEvent? = nil
        var nextWeekDateStr: String? = nil
        
        for ev in events {
            if let title = ev.title, title == "Shavuot II" && ev.yomtov == true {
                pesachEvent = ev
                if let eventDateStr = ev.date {
                    dateFormater.dateFormat = "yyyy-MM-dd"
                    if let eventDate = dateFormater.date(from: eventDateStr) {
                        if let nextWeekDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 7, to: eventDate) {
                            
                            // Checking for Saturday
                            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian) {
                                let weekday = gregorianCalendar.component(.weekday, from: nextWeekDate)
                                if weekday == 7 { // 7 Means Saturday
                                    nextWeekDateStr = dateFormater.string(from: nextWeekDate)
                                }
                            }
                        }
                    }
                }
            }
            // Next level Check:
            
            guard let ed = ev.date, let dateToComaper = nextWeekDateStr,
                ed == dateToComaper, let pEvent = pesachEvent else { continue }
            
            pEvent.title = "Naso I"
            ev.title = "Naso II"
            specialEvents.append(pEvent)
        }
        return specialEvents
    }
    
    func applyAchareiMotEventLogic(events: [RLEvent]) -> [RLEvent]  {
        var specialEvents = [RLEvent]()
        var pesachEvent: RLEvent? = nil
        var nextWeekDateStr: String? = nil
        
        for ev in events {
            if let title = ev.title, title == "Pesach VIII" && ev.yomtov == true {
                pesachEvent = ev
                if let eventDateStr = ev.date {
                    dateFormater.dateFormat = "yyyy-MM-dd"
                    if let eventDate = dateFormater.date(from: eventDateStr) {
                        if let nextWeekDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 7, to: eventDate) {
                            
                            // Checking for Saturday
                            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian) {
                                let weekday = gregorianCalendar.component(.weekday, from: nextWeekDate)
                                if weekday == 7 { // 7 Means Saturday
                                    nextWeekDateStr = dateFormater.string(from: nextWeekDate)
                                }
                            }
                        }
                    }
                }
            }
            // Next level Check:
            
            guard let title = ev.title, title == "Parashat Achrei Mot",
                let ed = ev.date, let dateToComaper = nextWeekDateStr,
                ed == dateToComaper, let pEvent = pesachEvent else { continue }
            
            pEvent.title = "Parashat Achrei Mot I"
            pEvent.category = "parashat"
            pEvent.subcat = ""
            ev.title = "Parashat Achrei Mot II"
            specialEvents.append(pEvent)
        }
        return specialEvents
    }
}


